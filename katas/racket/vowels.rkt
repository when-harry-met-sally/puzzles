#lang racket

(define vowels (hash "a" #t "e" #t "i" #t "o" #t "u" #t))

(define (count-vowels word)
  (let ([chars (string->list (string-downcase word))])
    (foldl (lambda (letter acc)
             (if (hash-ref vowels (string (char-downcase letter)) #f)
                 (add1 acc)
                 acc))
           0
           chars)))

(count-vowels "MIles") ; => 2
