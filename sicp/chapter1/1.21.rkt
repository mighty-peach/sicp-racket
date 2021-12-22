#lang sicp

(#%require rackunit)

(define (square n)
  (* n n))

(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisitor n test-divisitor)
  (cond [(> (square test-divisitor) n) n]
        [(divides? test-divisitor n) test-divisitor]
        [else (find-divisitor n (+ test-divisitor 1))]))

(define (smallest-divisitor n)
  (find-divisitor n 2))

(check-equal? (smallest-divisitor 199) 199)
(check-equal? (smallest-divisitor 1999) 1999)
(check-equal? (smallest-divisitor 19999) 7)
