#lang sicp

(#%require rackunit)

(define (pascals-triangle-num i j)
  (if (or (= i 1) (= i j))
    1
    (+
      (pascals-triangle-num i (- j 1))
      (pascals-triangle-num (- i 1) (- j 1)))))

(check-equal? (pascals-triangle-num 1 2) 1)
(check-equal? (pascals-triangle-num 2 3) 2)
(check-equal? (pascals-triangle-num 3 5) 6)
