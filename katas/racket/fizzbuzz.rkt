#lang racket

(define (fizzbuzz lst)
  (map (lambda (arg)
         (cond
           [(= (modulo arg 15) 0) "FizzBuzz"]
           [(= (modulo arg 5) 0) "Buzz"]
           [(= (modulo arg 3) 0) "Fizz"]
           [else arg]))
       lst))

(define res (fizzbuzz (list 1 2 3 4 5 6 15)))

(for-each println res)
