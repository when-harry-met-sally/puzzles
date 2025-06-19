#lang racket

(define (palindrome? word)
  (let ([chars (string->list (string-downcase word))]) (equal? chars (reverse chars))))

(palindrome? "raceca")
(palindrome? "racecar")

;; (define (my-equal? a b)
;;   (cond
;;     [(and (null? a) (null? b)) #t]                       ; both empty
;;     [(or (null? a) (null? b)) #f]                        ; one empty, one not
;;     [(not (equal? (car a) (car b))) #f]                  ; heads don't match
;;     [else (my-equal? (cdr a) (cdr b))]))                 ; recurse
