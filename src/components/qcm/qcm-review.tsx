'use client'

import * as React from 'react'
import { CheckCircle2, XCircle } from 'lucide-react'

import { cn } from '@/lib/utils'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Separator } from '@/components/ui/separator'
import { QCMQuestion, type QCMQuestionOption } from './qcm-question'

export interface ReviewQuestion {
  id: string
  questionText: string
  options: QCMQuestionOption[]
  selectedOptionId?: string
  correctOptionId: string
}

export interface QCMReviewProps extends React.HTMLAttributes<HTMLDivElement> {
  questions: ReviewQuestion[]
}

export function QCMReview({ questions, className, ...props }: QCMReviewProps) {
  const correctCount = questions.filter(
    (q) => q.selectedOptionId === q.correctOptionId
  ).length

  return (
    <div className={cn('space-y-6', className)} {...props}>
      {/* Summary */}
      <Card>
        <CardHeader>
          <CardTitle className="text-lg">Récapitulatif</CardTitle>
        </CardHeader>
        <CardContent>
          <div className="flex items-center gap-6">
            <div className="flex items-center gap-2">
              <CheckCircle2 className="h-5 w-5 text-success" />
              <span className="text-sm">
                <span className="font-semibold text-success">{correctCount}</span>{' '}
                correct{correctCount > 1 ? 's' : ''}
              </span>
            </div>
            <div className="flex items-center gap-2">
              <XCircle className="h-5 w-5 text-destructive" />
              <span className="text-sm">
                <span className="font-semibold text-destructive">
                  {questions.length - correctCount}
                </span>{' '}
                incorrect{questions.length - correctCount > 1 ? 's' : ''}
              </span>
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Questions list */}
      <div className="space-y-6">
        {questions.map((question, index) => {
          const isCorrect = question.selectedOptionId === question.correctOptionId

          return (
            <Card key={question.id}>
              <CardHeader className="pb-2">
                <div className="flex items-center gap-2">
                  {isCorrect ? (
                    <CheckCircle2 className="h-5 w-5 text-success" />
                  ) : (
                    <XCircle className="h-5 w-5 text-destructive" />
                  )}
                  <CardTitle className="text-base">
                    Question {index + 1}
                  </CardTitle>
                </div>
              </CardHeader>
              <Separator />
              <CardContent className="pt-4">
                <QCMQuestion
                  questionText={question.questionText}
                  options={question.options}
                  selectedOptionId={question.selectedOptionId}
                  correctOptionId={question.correctOptionId}
                  showResult
                  disabled
                />
              </CardContent>
            </Card>
          )
        })}
      </div>
    </div>
  )
}
