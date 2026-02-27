import path from 'path'
import { fileURLToPath } from 'url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))

/** Project root (learning-web/) */
export const PROJECT_ROOT = path.resolve(__dirname, '../../..')

/** Content source directory */
export const CONTENT_DIR = path.join(PROJECT_ROOT, 'content')

/** Output directory */
export const GENERATED_DIR = path.join(PROJECT_ROOT, 'src', 'generated')
