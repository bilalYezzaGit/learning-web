import { NextResponse } from 'next/server'
import fs from 'fs'
import path from 'path'

const ATOMS_DIR = path.join(process.cwd(), 'src', 'generated', 'atoms')

export async function GET(
  _request: Request,
  { params }: { params: Promise<{ id: string }> },
) {
  if (process.env.NODE_ENV !== 'development') {
    return NextResponse.json({ error: 'Dev only' }, { status: 403 })
  }

  const { id } = await params

  // Try HTML first (lesson/exercise), then JSON (QCM)
  const htmlPath = path.join(ATOMS_DIR, `${id}.html`)
  if (fs.existsSync(htmlPath)) {
    const html = fs.readFileSync(htmlPath, 'utf-8')
    return NextResponse.json({ type: 'html', id, html })
  }

  const jsonPath = path.join(ATOMS_DIR, `${id}.json`)
  if (fs.existsSync(jsonPath)) {
    const raw = fs.readFileSync(jsonPath, 'utf-8')
    const qcm = JSON.parse(raw) as Record<string, unknown>
    return NextResponse.json({ type: 'qcm', id, qcm })
  }

  return NextResponse.json({ error: `Atom "${id}" not found` }, { status: 404 })
}
