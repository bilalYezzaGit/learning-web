import { cn } from '@/lib/utils'
import { Card, CardContent } from '@/components/ui/card'

interface AuthFormCardProps {
  className?: string
  rightPanelSubtitle: string
  children: React.ReactNode
}

/**
 * Shared auth form layout: Card with form on left, branded panel on right.
 */
export function AuthFormCard({ className, rightPanelSubtitle, children }: AuthFormCardProps) {
  return (
    <div className={cn('flex flex-col gap-6', className)}>
      <Card className="overflow-hidden p-0">
        <CardContent className="grid p-0 md:grid-cols-2">
          {children}

          <div className="bg-primary relative hidden md:block">
            <div className="absolute inset-0 flex items-center justify-center">
              <div className="text-primary-foreground text-center p-8">
                <h2 className="text-3xl font-bold mb-4">Learning</h2>
                <p className="text-lg opacity-90">{rightPanelSubtitle}</p>
              </div>
            </div>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
