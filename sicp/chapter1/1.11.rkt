#lang sicp

(#%require rackunit)

(define (f-rec n)
  (if (< n 3)
    n
    (+
      (f-rec (- n 1))
      (f-rec (- n 2))
      (f-rec (- n 3)))))

;;; Iteration -----
;;; 0.
;;; a -> 2 (f n + 2)
;;; b -> 1 (f n + 1)
;;; c -> 0 (f n)
;;; 1.
;;; a -> a + b + c -> 3
;;; b -> a -> 2
;;; c -> b -> 1
;;; ---------------

(define (f n)
  (define (f-iter a b c count)
    (if (= count 0)
      c
      (f-iter (+ a b c) a b (- count 1))))
  (f-iter 2 1 0 n))

(check-equal? (f-rec 4) 6)
(check-equal? (f 4) 6)
