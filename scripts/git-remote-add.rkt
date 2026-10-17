#!/usr/bin/env racket
#lang racket

(require racket/system)
(require racket/string)

(define (ensure-git-suffix url)
  (define trimmed (string-trim url))
  (if (string-suffix? trimmed ".git")
      trimmed
      (string-append trimmed ".git")))

(define (clear-push-urls)
  (displayln "clearing existing push urls...")
  (system "git config --unset-all remote.origin.pushurl > /dev/null 2>&1")
  (void))

(define (add-push-url url)
  (define formatted-url (ensure-git-suffix url))
  (printf "adding push url: ~a\n" formatted-url)
  (define cmd (format "git remote set-url --add --push origin ~a" formatted-url))
  (system cmd))

(module+ main
  (clear-push-urls)

  (define args (current-command-line-arguments))

  (if (> (vector-length args) 0)
      (for ([url (in-vector args)])
        (add-push-url url))

      (begin
        (displayln "paste repository urls (one per line).")
        (displayln "leave blank and press enter when finished:")
        (let loop ()
          (display "> ")
          (define input (read-line))
          (unless (or (eof-object? input) (string=? (string-trim input) ""))
            (add-push-url input)
            (loop)))))

  (displayln "\ndone! current remotes:")
  (system "git remote -v"))
