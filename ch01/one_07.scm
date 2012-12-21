; The good-enough? test used in computing square
; roots will not be very effective for finding the square roots of very
; small numbers. Also, in real computers, arithmetic operations are
; almost always performed with limited precision. This makes our
; test inadequate for very large numbers. Explain these statements,
; with examples showing how the test fails for small and large num-
; bers. An alternative strategy for implementing good-enough? is to
; watch how guess changes from one iteration to the next and to
; stop when the change is a very small fraction of the guess. Design
; a square-root procedure that uses this kind of end test. Does this
; work better for small and large numbers?

; 'good-enough?'' as written originally compared the absolute value of the
; difference between the guess squared and the argument. If that difference
; is smaller than 0.001, 'good-enough?' returns #t. If we try to obtain the 
; square root of a number smaller than 0.001 we may trigger 'good-enough?' to
; return #t with just about any guess since the precision of the test is not 
; scaled properly.

; Real computers perform arithmetic operations with limited precision because
; they are limited in the amount of memory available in the host system. 

(define (square x) (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
(if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

; We can see the issue with small numbers by taking the square root of 
; 1e-80 which should produce 1e-40 as the correct answer but yields 0.03125
; (display (sqrt 1e-80))
; (newline)

; If we attempt to obtain the square root of a large number, we will continue
; to loop until we run out of memory as the difference between our guess and
; the value in question may require more iterations to achieve a difference 
; less than 0.001 than can be managed by available host memory.
(display (sqrt 16e64))
(newline)