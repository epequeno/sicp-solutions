;Define a procedure that takes three numbers as arguments and returns the 
;sum of the squares of the two larger numbers.

(define (square n) (* n n))

(define (sum-of-squares a b c) 
(cond ((= (min a b c) a) (+ (square b) (square c)))
      ((= (min a b c) b) (+ (square a) (square c)))
      ((= (min a b c) c) (+ (square a) (square b)))))
(display (sum-of-squares 5 4 3))
(newline)
