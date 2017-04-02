#lang racket
; 这是一个函数, 执行顺序是应用序, 所以在执行中会对所有参数求值, 即 conditon, then-clause, else-clause,
; 之后再进行运算
(define (new-if condition then-clause else-clause)
  (cond (condition then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

; 由于 new-if 执行应用序, 会先计算 (good-enough? guess x), guess, (sqrt-iter-2 (improve guess x) x) 三个参数的值,
; 前两个没有问题, 但是迪桑参数求值时陷入死循环

(define (sqrt-iter-2 guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter-2 (improve guess x) x)))

(define (square x) (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) (epsilon x)))

(define (epsilon x)
  (if (> (abs x) 1)
      0.001
      (* 0.001 x)))

(define (sqrt1 x) (sqrt-iter 1.0 x))
