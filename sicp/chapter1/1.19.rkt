#lang sicp

(#%require rackunit)

(define (fib-iter a b p q count)
  (cond [(= count 0) b]
        [(even? count)
          (fib-iter a
                    b
                    (+ (* p p) (* q q))
                    (+ (* 2 q p) (* q q))
                    (/ count 2))]
        [else
          (fib-iter (+ (* b q) (* a q) (* a p))
                    (+ (* b p) (* a q))
                    p
                    q
                    (- count 1))]))

(define (fib n)
  (fib-iter 1 0 0 1 n))

(check-equal? (fib 1) 1)
(check-equal? (fib 3) 2)
(check-equal? (fib 4) 3)
