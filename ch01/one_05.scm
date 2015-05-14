; Ben Bitdiddle has invented a test to determine
; whether the interpreter he is faced with is using applicative-order
; evaluation or normal-order evaluation. He defines the following
; two procedures:

(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

; Then he evaluates the expression
(test 0 (p))

; What behavior will Ben observe with an interpreter that uses
; applicative-order evaluation? What behavior will he observe with
; an interpreter that uses normal-order evaluation? Explain your
; answer. (Assume that the evaluation rule for the special form if
; is the same whether the interpreter is using normal or applicative
; order: The predicate expression is evaluated first, and the result
; determines whether to evaluate the consequent or the alternative
; expression.)

; Since guile is applicative order the interpreter will get stuck in a
; recursive loop, test will return 0 and then try to run (p) which is
; defined recursivly as (p). The interpreter just hangs without knowing
; what to do next. It is trying to work all the parts of the definition out
; and then return a value.

; If the interpreter had been normal order, it would have stopped as soon as
; it had completed the if test. x = 0 and so that is what needed to be returned
; there was no need to evaluate what (p) was. The book puts it this way:
; "An alternative evaluation model would not evaluate the operands until their
;  values were needed."
