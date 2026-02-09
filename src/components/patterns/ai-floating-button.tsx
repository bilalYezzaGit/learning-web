'use client'

/**
 * AI Floating Action Button
 *
 * Persistent floating button that opens the AI tutor chat
 * in a slide-over sheet. Always available during learning.
 */

import * as React from 'react'
import { Bot } from 'lucide-react'

import { Button } from '@/components/ui/button'
import {
  Sheet,
  SheetContent,
  SheetHeader,
  SheetTitle,
  SheetDescription,
} from '@/components/ui/sheet'
import { cn } from '@/lib/utils'
import { AITutorChat } from '@/components/patterns/ai-tutor-chat'

interface AIFloatingButtonProps {
  context?: string
  topic?: string
  className?: string
}

export function AIFloatingButton({ context, topic, className }: AIFloatingButtonProps) {
  const [open, setOpen] = React.useState(false)

  return (
    <>
      {/* Floating button */}
      <Button
        size="icon"
        onClick={() => setOpen(true)}
        className={cn(
          'fixed bottom-20 right-4 z-40 h-12 w-12 rounded-full shadow-lg transition-transform hover:scale-105 lg:bottom-6 lg:right-6',
          className
        )}
        aria-label="Ouvrir le tuteur IA"
      >
        <Bot className="h-5 w-5" />
      </Button>

      {/* Chat sheet */}
      <Sheet open={open} onOpenChange={setOpen}>
        <SheetContent side="right" className="flex w-full flex-col p-0 sm:max-w-md" showCloseButton={false}>
          <SheetHeader className="sr-only">
            <SheetTitle>Tuteur IA</SheetTitle>
            <SheetDescription>
              Chat avec ton tuteur de maths personnel
            </SheetDescription>
          </SheetHeader>
          <AITutorChat
            context={context}
            topic={topic}
            className="flex-1 border-0 shadow-none rounded-none"
            onClose={() => setOpen(false)}
          />
        </SheetContent>
      </Sheet>
    </>
  )
}
