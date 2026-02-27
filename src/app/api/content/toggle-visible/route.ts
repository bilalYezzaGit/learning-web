import { NextResponse } from 'next/server'
import fs from 'fs'
import path from 'path'
import { execSync } from 'child_process'

export async function POST(request: Request) {
  if (process.env.NODE_ENV !== 'development') {
    return NextResponse.json({ error: 'Dev only' }, { status: 403 })
  }

  const body = (await request.json()) as {
    slug?: string
    kind?: string
    programmeId?: string
  }

  const { slug, kind, programmeId } = body
  if (!slug || !kind || !programmeId) {
    return NextResponse.json(
      { error: 'Missing required fields: slug, kind, programmeId' },
      { status: 400 },
    )
  }

  // Find the YAML file in content/{programmeId}/*/_molecules/{slug}.yaml
  const programmeDir = path.join(process.cwd(), 'content', programmeId)
  if (!fs.existsSync(programmeDir)) {
    return NextResponse.json(
      { error: `Programme directory not found: ${programmeId}` },
      { status: 404 },
    )
  }

  let yamlPath: string | null = null
  const modules = fs
    .readdirSync(programmeDir, { withFileTypes: true })
    .filter((d) => d.isDirectory() && !d.name.startsWith('_'))

  for (const mod of modules) {
    const candidate = path.join(
      programmeDir,
      mod.name,
      '_molecules',
      `${slug}.yaml`,
    )
    if (fs.existsSync(candidate)) {
      yamlPath = candidate
      break
    }
  }

  if (!yamlPath) {
    return NextResponse.json(
      { error: `YAML not found for ${kind} "${slug}" in ${programmeId}` },
      { status: 404 },
    )
  }

  // Toggle visible by string replacement
  const content = fs.readFileSync(yamlPath, 'utf-8')
  let newContent: string
  let newVisible: boolean

  if (content.includes('visible: true')) {
    newContent = content.replace('visible: true', 'visible: false')
    newVisible = false
  } else if (content.includes('visible: false')) {
    newContent = content.replace('visible: false', 'visible: true')
    newVisible = true
  } else {
    return NextResponse.json(
      { error: 'Could not find visible field in YAML' },
      { status: 500 },
    )
  }

  fs.writeFileSync(yamlPath, newContent, 'utf-8')

  // Re-run pipeline
  try {
    execSync('npx tsx tools/pipeline/src/index.ts', {
      cwd: process.cwd(),
      stdio: 'pipe',
      timeout: 30_000,
    })
  } catch (e) {
    const message = e instanceof Error ? e.message : 'Pipeline failed'
    return NextResponse.json({ error: message }, { status: 500 })
  }

  return NextResponse.json({ slug, visible: newVisible })
}
