#lang sicp

(#%require rackunit)

(define (cube x)
  (* x x x))

(define (improve guess x)
  (/
    (+
      (* 2 guess)
      (/ x (* guess guess)))
    3))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x)
                x)))

(define (sqrt-cubic x)
  (sqrt-iter 1.0 x))

(check-= (sqrt-cubic 8) 2 0.001)
