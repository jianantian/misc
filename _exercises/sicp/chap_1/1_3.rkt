#lang racket
(define (max_sum a b c) (if (< a b) (+ b (max a c)) (+ a (max b c))))
(max_sum 2 3 7)