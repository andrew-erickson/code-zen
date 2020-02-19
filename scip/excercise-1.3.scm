; Exercise 1.3.  Define a procedure that takes three numbers as
; arguments and returns the sum of the squares of the two larger 
; numbers.

(define (square x) (* x x))

(define (sum-of-squares x y)
    (+ (square x) (square y)))

(define (sum-of-squares-of-larger-two a b c)
    (cond ((or (and (> a b) (> b c))
               (and (= a b) (> b c))) (sum-of-squares a b))
          ((or (and (< a b) (< b c))
               (and (< a b) (= b c))) (sum-of-squares b c))
          ((or (and (< a b) (< c b))
               (and (= a c) (< c b))) (sum-of-squares a c))))
           
