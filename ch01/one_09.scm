; Each of the following two procedures defines
; a method for adding two positive integers in terms of the
; procedures inc, which increments its argument by 1, and dec,
; which decrements its argument by 1.
; (define (+ a b)
;   (if (= a 0) b (inc (+ (dec a) b))))
; (define (+ a b)
;   (if (= a 0) b (+ (dec a) (inc b))))
; Using the substitution model, illustrate the process generated by
; each procedure in evaluating (+ 4 5). Are these processes iterative
; or recursive?
;
;
; First procedure:
; (+ 4 5)
;   (= a 0) -> #f
;   (inc (+ (dec a) b))
;     (dec a) -> 3
;     (+ 3 5)
;       (= a 0) -> #f
;       (inc (+ (dec a) b))
;         (dec a) -> 2
;         (+ 2 5)
;           (= a 0) -> #f
;           (inc (+ (dec a) b))
;             (dec a) -> 1
;             (+ 1 5)
;               (= a 0) -> #f
;               (inc (+ (dec a) b))
;                 (dec a) -> 0
;                 (+ 0 5)
;                   (= a 0) -> #t
;                     5
;               (inc 5) -> 6
;           (inc 6) -> 7
;       (inc 7) -> 8
;   (inc 8) -> 9
;
; Second procedure:
; (+ 4 5)
;   (= a 0) -> #f
;     (+ (dec a) (inc b))
;     (+ 3 6)
;       (= a 0) -> #f
;         (+ (dec a) (inc b))
;         (+ 2 7)
;           (= a 0) -> #f
;             (+ (dec a) (inc b))
;             (+ 1 8)
;               (= a 0) -> #f
;                 (+ (dec a) (inc b))
;                 (+ 0 9)
;                   (= a 0) -> #t
;                     9
;     
; The first procedure is recursive. When the test (= a 0) yields #f we call 
; 'inc', which calls '+' which itself calls 'inc' again. This pattern will
; continue until 'a' has been decremented enough to make (= a 0) yield #t.
; At that point the values can be passed back up and 'inc' cna be applied to 
; the returned values, the interpreter has to keep track of each call until
; a final value is determined. The shape of the execution is clearly growth 
; and contraction.
;
;
; The second procedure exemplifies the difference between a recursive procedure
; and a recursive process. The definition of (+ a b) has within it a call to itself
; making it a recursive procedure but the process is still iterative.
;  
;  "When we describe a procedure as recursive, we are referring to the sytactic
;  fact that the procedure definition refers (either directly or indirectly)
;  to the procedure itself"
;
; With each recursion a state is being passed along rather than a call having
; to wait for a return value. The shape of execution looks somewhat similar 
; to the first  procedure in the way it grows with each recursion but once 
; (= a 0) yields #t the final value can be returned without having to pass it
; back to a parent call as in the first procedure.
