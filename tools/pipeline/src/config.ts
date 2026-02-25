import path from 'path'
import { fileURLToPath } from 'url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))

/** Project root (learning-web/) */
export const PROJECT_ROOT = path.resolve(__dirname, '../../..')

/** Content source directories */
export const CONTENT_DIR = path.join(PROJECT_ROOT, 'content')
export const ATOMS_DIR = path.join(CONTENT_DIR, 'atoms')
export const MOLECULES_DIR = path.join(CONTENT_DIR, 'molecules')
export const COURS_DIR = path.join(MOLECULES_DIR, 'cours')
export const SERIES_DIR = path.join(MOLECULES_DIR, 'series')
export const PROGRAMMES_DIR = path.join(MOLECULES_DIR, 'programmes')

/** Output directory */
export const GENERATED_DIR = path.join(PROJECT_ROOT, 'src', 'generated')
