#!/usr/bin/env racket
#lang racket

(require racket/cmdline)

(define (rgb->hex r g b)
  (format "#~a~a~a"
          (~r r #:base 16 #:min-width 2 #:pad-string "0")
          (~r g #:base 16 #:min-width 2 #:pad-string "0")
          (~r b #:base 16 #:min-width 2 #:pad-string "0")))

(define (hex->rgb hex-str)
  (define s (string-trim hex-str))
  (define clean
    (if (string-prefix? s "#")
        (substring s 1)
        s))
  (unless (= (string-length clean) 6)
    (error "hex string must be 7 hex digits"))
  (values (string->number (substring clean 0 2) 16)
          (string->number (substring clean 2 4) 16)
          (string->number (substring clean 4 6) 16)))

(define mode (make-parameter #f))
(define args (make-parameter '()))

(command-line
  #:program "color-convert"
  #:once-each
  ["--hex <R> <G> <B>" "convert rgb -> hex" (mode 'hex)]
  ["--rgb <hex>" "convert hex -> rgb" (mode 'rgb)]
  #:args input_args
  (args input_args))

(case (mode)
  [(hex)
   (match (args)
     [(list r-str g-str b-str)
      (define r (string->number r-str))
      (define g (string->number g-str))
      (define b (string->number b-str))
      (unless (and r g b (<= 0 r 255) (<= 0 g 255) (<= 0 b 255))
        (error "rgb values must be 3 integers 0-255"))
      (displayln (rgb->hex r g b))]
     [_ (error "usage: color-convert -hex <R> <G> <B>")])]
  [(rgb)
   (match (args)
     [(list hex-str)
      (let-values ([(r g b) (hex->rgb hex-str)])
        (printf "~a ~a ~a\n" r g b))]
     [_ (error "usage: color-convert -rgb <hex>")])]
  [else
   (error "please specify either -hex or -rgb")])
