#lang racket

(define (count-frequency str)
  (let ([words (string-split str)])
    (foldl (lambda (word acc)
             (cond
               [(equal? word #t) #t]
               [else #t])
             (make-hash)
             words))))

(count-frequency "test my n")
