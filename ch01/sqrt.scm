;Define procedure to determine the square root of a number by Newtowns method.
;function 'square' must be defined for sqrt-iter to work, 'abs' is a built-in.

(define (square x) (* x x))

(define (abs x) 
  (cond ((< x 0) (- x))
        (else x)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
