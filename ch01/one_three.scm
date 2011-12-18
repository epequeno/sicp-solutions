;Define a procedure that takes three numbers as argu-
;ments and returns the sum of the squares of the two larger num-
;bers.

(define (square n) (* n n))

(define (sum-of-squares a b c) (cond (= (min a b c) a) (+ (square b) (square c))
                                     (= (min a b c) b) (+ (square a) (square c))
                                     (else (+ (square a) (square b)))))
(display (sum-of-squares 3 4 5))
(newline)
