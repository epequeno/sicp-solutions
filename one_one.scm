;Below is a sequence of expressions. What is the result
;printed by the interpreter in response to each expression? Assume
;that the sequence is to be evaluated in the order in which it is pre-
;sented.

(display 10)
; Will print the integer 10
(newline)

(display (+ 5 3 4))
; Will print the sum of 5, 3, and 4 which is 12
(newline)

(display (- 9 1))
; Will print the difference between 9 and 1 which is 8
(newline)

(display (/ 6 2))
; Will print the result of 6 divided by 2 which is 3
(newline)

(display (+ (* 2 4) (- 4 6)))
; Will find the difference between 4 and 6 (-2) and the product
; of 4 and 2 (8) then add those two results to give 6
(newline)

(define a 3)
; Nothing will print, the variable 'a' will be set to 3

(define b (+ a 1))
; Nothing will print, the variable 'b' will be set to a plus 1, 4

(display (+ a b (* a b)))
; Will print the product of a and b, 12 and the sum of that product with 
; a and b so 3 + 4 + 12, 19
(newline)

(display (= a b))
; Will print whether a is equal to b in this case 3 is not equal to 4 so #f
(newline)

(if (and (> b a) (< b (* a b)))
    (display b)
    (display a))
; Will test if the product of a and b is greater than b, in this case it is
; true, it will also test if b is greater than a, also true. In the case 
; that both those tests are true, the first consequent is produced, b
; had either been false then a would have been printed.
(newline)

(cond ((= a 4) (display 6))
      ((= b 4) (display (+ 6 7 a)))
      (else (display 25)))
; Tests several conditions, the first is if a is equal to 4, not true
; the second test is if b is equal to 4 which is true, so the sum of 
; 6, 7, and a is printed so 16. Had that not been true then 25 would 
; have been printed since no previous test was true.
(newline)

(display (+ 2 (if (> b a) b a)))
; Will test if b is greater than a, which is true so b is returned.
; Then b will be added to 2 so 6 is printed.
(newline)

(display (* (cond ((> a b) a)
                  ((< a b) b)
                  (else -1))
            (+ a 1)))
; Tests several conditions, if a is greater than b (not true) a would be 
; displayed. The second condition, a less than b (true) gets evaluated so 
; b is returned and multiplied with the sum of a and 1 (4) so the final 
; result is 16
(newline)
