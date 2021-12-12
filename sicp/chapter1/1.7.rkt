#lang sicp

(#%require rackunit)

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x)
                x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (good-enough-prev? prev-guess guess)
  (< (abs (- prev-guess guess)) 0.001))

(define (sqrt-iter-prev prev-guess guess x)
  (if (good-enough-prev? prev-guess guess)
    guess
    (sqrt-iter-prev guess (improve guess x) x)))

(define (sqrt-with-prev x)
  (sqrt-iter-prev x 1.0 x))

(check-= (sqrt 4) 2 0.001)
(check-= (sqrt-with-prev 4) 2 0.001)
