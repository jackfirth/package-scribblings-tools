#lang racket

(require scribble/eval)

(provide define-custom-examples)

(define-syntax-rule (define-custom-examples id require-spec ...)
  (begin
    (define custom-eval (make-base-eval))
    (custom-eval '(require require-spec)) ...
    (define-custom-example-eval id custom-eval)))

(define-syntax-rule (define-custom-example-eval id eval)
  (define-syntax-rule (id body (... ...))
    (examples #:eval eval body (... ...))))
