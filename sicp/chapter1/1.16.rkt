#lang sicp

(#%require rackunit)

(define (square n)
  (* n n))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt b n)
  (cond [(= n 0) 1]
        [(even? n) (square (fast-expt b (/ n 2)))]
        [else (* b (fast-expt b (- n 1)))]))

(define (fast-expt-1 b n)
  (define (fast-expt-iter result step)
    (if (<= step 1)
      result
      (cond [(even? step) (fast-expt-iter (square result) (/ step 2))]
            [else (fast-expt-iter (* b result) (- step 1))])))
  (fast-expt-iter b n))

(check-equal? (fast-expt 2 2) 4)
(check-equal? (fast-expt-1 2 2) 4)
