#lang sicp

(#%require rackunit)

(define (double n)
  (* n 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-mult a b)
  (define (fast-mult-iter result n)
    (cond [(= n 1) result]
          [else (fast-mult-iter (+ result a) (- n 1))]))
  (fast-mult-iter a b))

(check-equal? (fast-mult 2 3) 6)
(check-equal? (fast-mult 3 3) 9)
