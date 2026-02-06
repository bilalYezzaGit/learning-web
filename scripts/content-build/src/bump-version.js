#!/usr/bin/env node
/**
 * Bump Remote Config content_version
 *
 * Increments the content_version parameter in Firebase Remote Config
 * to trigger cache refresh on all clients.
 *
 * Uses Firebase CLI credentials stored locally.
 *
 * Usage:
 *   node src/bump-version.js
 */

import { execSync } from 'child_process';
import { readFileSync, writeFileSync, unlinkSync, existsSync } from 'fs';
import { tmpdir, homedir } from 'os';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT_DIR = join(__dirname, '../../..');
const TEMP_FILE = join(tmpdir(), 'remoteconfig_template.json');

// Get project ID from Firebase CLI
function getProjectId() {
  try {
    const result = execSync('firebase use', { encoding: 'utf-8', stdio: ['pipe', 'pipe', 'pipe'] });
    return result.trim();
  } catch {
    throw new Error('Could not get Firebase project ID. Run "firebase use <project>"');
  }
}

// Get access token from Firebase CLI config
function getAccessToken() {
  const configPath = join(homedir(), '.config', 'configstore', 'firebase-tools.json');
  if (!existsSync(configPath)) {
    throw new Error('Firebase CLI not logged in. Run "firebase login"');
  }

  const config = JSON.parse(readFileSync(configPath, 'utf-8'));
  const tokens = config.tokens;

  if (!tokens?.access_token) {
    throw new Error('No access token found. Run "firebase login --reauth"');
  }

  // Check if token needs refresh
  if (tokens.expires_at && Date.now() > tokens.expires_at) {
    // Token expired, try to refresh
    console.log('   Token expired, refreshing...');
    execSync('firebase login --reauth', { stdio: 'inherit' });
    // Re-read config
    const newConfig = JSON.parse(readFileSync(configPath, 'utf-8'));
    return newConfig.tokens?.access_token;
  }

  return tokens.access_token;
}

async function bumpVersion() {
  console.log('\n📡 Updating Remote Config content_version...\n');

  try {
    const projectId = getProjectId();
    console.log(`   Project: ${projectId}`);

    // 1. Get current Remote Config template using Firebase CLI
    console.log('   Fetching current template...');
    execSync(`firebase remoteconfig:get -o ${TEMP_FILE}`, { stdio: 'pipe' });

    // 2. Read and parse template
    const template = JSON.parse(readFileSync(TEMP_FILE, 'utf-8'));

    // 3. Get current version and increment
    const currentVersion = parseInt(
      template.parameters?.content_version?.defaultValue?.value || '0',
      10
    );
    const newVersion = currentVersion + 1;

    console.log(`   Current version: ${currentVersion}`);
    console.log(`   New version: ${newVersion}`);

    // 4. Update the template
    if (!template.parameters) {
      template.parameters = {};
    }
    if (!template.parameters.content_version) {
      template.parameters.content_version = {
        defaultValue: { value: '0' },
        description: 'Version du contenu pour invalidation du cache',
      };
    }
    template.parameters.content_version.defaultValue.value = String(newVersion);

    // Remove version info (causes etag conflict)
    delete template.version;

    // 5. Get access token and call REST API
    console.log('   Publishing updated template...');
    const accessToken = getAccessToken();

    const apiUrl = `https://firebaseremoteconfig.googleapis.com/v1/projects/${projectId}/remoteConfig`;

    // Write template to temp file for curl
    writeFileSync(TEMP_FILE, JSON.stringify(template, null, 2));

    const curlCommand = `curl -s -X PUT "${apiUrl}" \
      -H "Authorization: Bearer ${accessToken}" \
      -H "Content-Type: application/json; UTF8" \
      -H "If-Match: *" \
      -d @${TEMP_FILE}`;

    const response = execSync(curlCommand, { encoding: 'utf-8' });
    const responseData = JSON.parse(response);

    if (responseData.error) {
      throw new Error(responseData.error.message || 'API error');
    }

    // 6. Cleanup
    unlinkSync(TEMP_FILE);

    console.log(`\n✅ Remote Config updated: content_version = ${newVersion}`);
    console.log('   Clients will refresh cache on next app launch.\n');

  } catch (error) {
    console.error('\n⚠️  Could not auto-update Remote Config:', error.message);
    console.error('\n   To update manually:');
    console.error('   1. Go to Firebase Console > Remote Config');
    console.error('   2. Increment content_version parameter');
    console.error('   3. Publish changes\n');
    // Don't exit with error - deploy was successful, just RC update failed
  }
}

// Run
bumpVersion();
