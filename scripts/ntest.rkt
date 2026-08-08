#!/usr/bin/env racket
#lang racket

(require json)

(define flake-path "/etc/nixos")
(define system-arch "x86_64-linux")

(define (get-hostname)
  (string-trim (with-output-to-string (lambda () (system "hostname")))))

(define (get-all-checks)
  (define json-str
    (with-output-to-string
      (lambda ()
        (system (format
                  "nix eval --json ~a#checks.~a --apply 'builtins.attrNames' 2>/dev/null"
                  flake-path
                  system-arch)))))

  (if (string=? (string-trim json-str) "")
      (begin
        (displayln "Error: Could not read tests from the flake.")
        (displayln "Your Nix configuration might have evaluation errors")
        (displayln "Run 'ntest' without arguments to see the raw errors.")
        (exit 1))
      (with-handlers ([exn:fail? (lambda (_e) '())])
        (read-json (open-input-string json-str)))))

(define (run-all-tests)
  (printf "Running full test suite from ~a...\n" flake-path)
  (define success? (system (format "nix flake check ~a -L" flake-path)))
  (unless success? (exit 1)))

(define (run-specific-test test-name)
  (define host (get-hostname))
  (define target-check (format "~a-~a" host test-name))
  (define checks (get-all-checks))

  (cond
    [(member target-check checks)
     (printf "Running test: ~a\n" target-check)
     (define success? (system (format
                                "nix build ~a#checks.~a.~a -L"
                                flake-path
                                system-arch
                                target-check)))
     (unless success? (exit 1))]

    [(for/or ([c (in-list checks)]) (string-suffix? c (format "-~a" test-name)))
     (printf
       "Error: The test '~a' exists, but it is not enabled for this host (~a).\n"
       test-name
       host)
     (exit 1)]

    [else
     (printf "Error: The test '~a' does not exist.\n" test-name)
     (exit 1)]))

(define args (current-command-line-arguments))

(if (= (vector-length args) 0)
    (run-all-tests)
    (run-specific-test (vector-ref args 0)))
