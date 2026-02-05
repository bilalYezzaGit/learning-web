/**
 * Content rendering utilities
 */

import type { DOMNode, Element } from 'html-react-parser'

/**
 * Check if a DOMNode is an Element
 */
export function isElement(node: DOMNode): node is Element {
  return node.type === 'tag'
}

/**
 * Get text content from an element, handling nested children
 */
export function getTextContent(element: Element): string {
  let text = ''

  for (const child of element.children || []) {
    if (child.type === 'text') {
      text += (child as { data: string }).data
    } else if (child.type === 'tag') {
      text += getTextContent(child as Element)
    }
  }

  return text
}

/**
 * Decode HTML entities commonly found in math content
 */
export function decodeHtmlEntities(text: string): string {
  return text
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&amp;/g, '&')
    .replace(/&quot;/g, '"')
    .replace(/&#39;/g, "'")
    .replace(/&nbsp;/g, ' ')
}

/**
 * Parse a list string like "[a,b,c]" into an array
 */
export function parseList(listStr: string): string[] {
  const cleaned = listStr.replace(/^\[/, '').replace(/\]$/, '').trim()
  if (!cleaned) return []
  return cleaned.split(',').map((s) => s.trim())
}

/**
 * Parse a range string like "[-5,5]" into [min, max]
 */
export function parseRange(rangeStr: string): [number, number] {
  try {
    const cleaned = rangeStr.replace(/^\[/, '').replace(/\]$/, '')
    const parts = cleaned.split(',')
    if (parts.length === 2) {
      return [parseFloat(parts[0]!.trim()), parseFloat(parts[1]!.trim())]
    }
  } catch {
    // Fall through to default
  }
  return [-5, 5]
}

/**
 * Get attribute value with fallback
 */
export function getAttr(
  element: Element,
  name: string,
  fallback: string = ''
): string {
  return element.attribs?.[name] ?? fallback
}

/**
 * Get boolean attribute
 */
export function getBoolAttr(element: Element, name: string): boolean {
  const value = element.attribs?.[name]
  return value === 'true' || value === ''
}
