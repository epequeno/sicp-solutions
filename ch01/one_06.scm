; Alyssa P Hacker doesn't see why if needs to be provided as a special
; form. "Why can't I just define it as an ordinary procedure in terms
; of cond?" she asks. Alyssa's friend Eva Lu Ator claims this can indeed
; be done, and she defines a new version of if:
; (define (new-if predicate then-clause else-clause) 
;    (cond (predicate then-clause)
;          (else else-clause)))
; Eva demonstrates the program for Alyssa:
;   (new-if (= 2 3) 0 5)
;   5
;   (new-if (= 1 1) 0 5)
;   0
; Delighted, Alyssa uses new-if to rewrite the square-root program:
; (define (sqrt-iter guess x)
;  (new-if (good-enough? guess x)
;           guess
;           (sqrt-iter (improve guess x)
;                      x)))
; What happens when Alyssa attempts to use this to compute sqare
; roots? Explain.

(define (square x) (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

;(define (sqrt-iter guess x)
; (if (good-enough? guess x)
;     guess
;     (sqrt-iter (improve guess x) x)))

 (define (sqrt-iter guess x)
   (new-if (good-enough? guess x)
           guess
           (sqrt-iter (improve guess x) x)))

;(display (if (> 1 0) 1 (/ 1 0)))
(display (new-if (> 1 0) 1 (/ 1 0)))
(newline)

; Using new-if produces a stack overflow. This has to do with 
; normal order execution vs applicative order. If we try to obtain
; all the params of the cond in 'new-if' we recursivly try to call
; 'sqrt-iter' endlessly. The built-in 'if' will break eventually when
; 'good-enough?' returns #t. This is a tricky one to debug since different
; interpreters will handle the operations differently. For example guile will
; throw an error when we try to evaluate (new-if (> 1 0) 1 (/ 1 0)) which 
; would throw a 'divide by 0' error if all params were evaluated but, scm does 
; not. When loaded into scm, this file will return '1' with no errors with both
; 'if' and 'new-if'. 
; http://danboykis.com/2009/05/exercise-16-of-sicp/
