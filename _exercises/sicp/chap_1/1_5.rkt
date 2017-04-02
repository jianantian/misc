#lang racket
; 正则序和应用序

(define (p) (p))
(define (test x y) (if (= x 0) 0 y))
; 运行(test 0 (p))
; 若为正则序, 则结果为 0
; 若为应用序, 则陷入无穷递归