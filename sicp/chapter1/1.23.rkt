#lang sicp

(#%require rackunit)

(define (square n)
  (* n n))

(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisitor n test-divisitor)
  (cond [(> (square test-divisitor) n) n]
        [(divides? test-divisitor n) test-divisitor]
        [else (find-divisitor n (next test-divisitor))]))

(define (next n)
  (if (= n 2)
    3
    (+ n 2)))

(define (smallest-divisitor n)
  (find-divisitor n 2))

(define (prime? n)
  (= (smallest-divisitor n) n))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))
      false))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline)
  true)

(define (search-for-primes start-number prime-count)
  (if (> prime-count 0)
    (if (timed-prime-test start-number)
      (search-for-primes (+ start-number 1) (- prime-count 1))
      (search-for-primes (+ start-number 1) prime-count))))

(search-for-primes 10000000 3)
(search-for-primes 100000000 3)
(search-for-primes 1000000000 3)
;; for 10^7 t1 ≈ 5 (prev 9)
;; for 10^8 t2 ≈ 17 (prev 33)
;; for 10^9 t3 ≈ 55 (prev 102)