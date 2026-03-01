/**
 * Error Logger
 *
 * Structured error logging for MVP.
 * Logs to console with structured format.
 * Ready to be extended with external services (Sentry, etc.)
 */

interface ErrorContext {
  component?: string
  action?: string
  userId?: string
  metadata?: Record<string, unknown>
}

function formatError(error: unknown): { message: string; stack?: string } {
  if (error instanceof Error) {
    return { message: error.message, stack: error.stack }
  }
  return { message: String(error) }
}

export function logError(error: unknown, context?: ErrorContext): void {
  const { message, stack } = formatError(error)

  const entry = {
    level: 'error' as const,
    timestamp: new Date().toISOString(),
    message,
    ...context,
    ...(stack && { stack }),
  }

  console.error('[Learning Error]', JSON.stringify(entry))
}

