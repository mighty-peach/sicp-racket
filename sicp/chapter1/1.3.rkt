#lang sicp

(#%require rackunit)

(define (sum-of-squares a b)
  (+ (* a a) (* b b)))

(define (solution x y z)
  (if (>= x y)
    (if (>= y z)
      (sum-of-squares x y)
      (sum-of-squares x z))
    (if (>= x z)
      (sum-of-squares x y)
      (sum-of-squares y z))))

(check-equal? (solution 1 2 3) 13)
(check-equal? (solution 3 2 1) 13)
(check-equal? (solution 3 1 2) 13)
(check-equal? (solution 2 3 1) 13)
