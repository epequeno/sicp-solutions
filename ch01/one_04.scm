; Observe that our model of evaluation allows for combinations whose
; operators are compound expressions. Use this observation to describe
; the behavior of the following procedure

(define (a-plus-abs-b a b)
((if (> b 0) + -) a b))

; We are testing if b is greater than 0. If b is greater than 0 the '+'
; operator is returned. If b is less than or equal to 0 then the '-' is
; used. a and b will either be added or subtracted depending on the
; value of b. The end result is that since we subtract whenever b
; is negative or 0 we use the absolute value of b.

; In this example 2 > 0 so the '+' is used and the result is 1 + 2 = 3

(display (a-plus-abs-b 1 2))
(newline)

; In this example 0 !> 0 so the '-' is used and the result is 1 - 0 = 1

(display (a-plus-abs-b 1 0))
(newline)

; In this final example 2 !> 0 so the '-' is used again and the result is
; 1 - (-2) = 1 + 2 = 3

(display (a-plus-abs-b 1 -2))
(newline)
