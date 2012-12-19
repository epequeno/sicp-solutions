;Define procedure to determine the square root of a number by Newtowns method.
;function 'square' must be defined for 'sqrt-iter' to work, 'abs' is a built-in.
;'sqrt' is also a built-in function so we must redefine it here.

(define (square x) (* x x))

;(define (sqrt-iter guess x)
;  (if (good-enough? guess x)
;      guess
;      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;(display (sqrt 9))
;(newline)

;(display (sqrt (+ 100 37)))
;(newline)

;(display (sqrt (+ (sqrt 2) (sqrt 3))))
;(newline)

;(display (square (sqrt 1000)))
;(newline)

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

(display (sqrt 9))
(newline)
