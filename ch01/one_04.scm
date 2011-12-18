;Observe that our model of evaluation allows for combinations whose 
;operators are compound expressions. Use this observation to describe
;the behavior of the following procedure

(define (a-plus-abs-b a b)
((if (> b 0) + -) a b))

; We are tesing if b is greater than 0, if that is true the '+' operator is 
; returned if b is less than 0 then the negation is returned so that the 
; operation becomes subtracting a negative number or adding the positive 
; absolute value of that number.

