(load "util.scm")

(define (prime? x)
  (cond ((<= x 1) #f)
	((< x 4) #t) ; 2 and 3 are prime
	((= (remainder x 2) 0) #f)
	((< x 9) #t) ; already excluded 4, 6 and 8
	((= (remainder x 3) 0) #f)
	(else (let ((largest-factor (floor (sqrt x))))
		(let loop ((factor 5))
		  (cond ((> factor largest-factor) #t)
			;; all primes > 3 can be written as 6k +/- 1
			;; we only want to check if primes are factors,
			;; so we don't need to check if factor + 4 is a factor
			((= (remainder x factor) 0) #f)
			((= (remainder x (+ factor 2)) 0) #f)
			(loop (+ factor 6))))))))

(define (nth-prime n)
  (let ((calculate-next-prime (get-prime-generator)))
    (let loop ((count 1)
	       (prime (calculate-next-prime)))
      (if (>= count n)
	  prime
	  (loop (+ count 1)
		(calculate-next-prime))))))

(define (get-prime-generator)
  (define (generator)
    (call/cc next-prime))

  (define (next-prime return)

    (define (yield n)
      (set! return
	    (call/cc
	     (lambda (resume-here)
	       (set! next-prime resume-here)
	       (return n)))))

    (yield 2)
    (yield 3)
    (let loop ((candidate 5))
      (if (prime? candidate)
	  (yield candidate))
      (let ((candidate (+ candidate 2)))
	(if (prime? candidate)
	    (yield candidate)))
      (loop (+ candidate 6))))

  generator)

(define (list-primes-up-to n)

  (define (sieve->list sieve)
    (let ((index-bound (vector-length sieve)))
      (let loop ((index 0)
		 (lst '(2)))
	(if (>= index index-bound)
	    (reverse lst)
	    (if (vector-ref sieve index)
		(loop (+ index 1)
		      (cons (+ (* index 2) 1) lst))
		(loop (+ index 1)
		      lst))))))

  (let* ((sieve-bound (+ (quotient (- n 1) 2) 1))
	 (sieve (make-vector sieve-bound #t))
	 (cross-limit (quotient (- (floor (sqrt n)) 1) 2)))
    (vector-set! sieve 0 #f) ; set 1 to not prime
    (let sieve-loop ((index 1))
      (if (> index cross-limit)
	  (sieve->list sieve)
	  (begin
	    (if (vector-ref sieve index) ; it's prime!
		(let multiples-loop ((index (* 2 index (+ index 1))))
		  (if (>= index sieve-bound)
		      '()
		      (begin
			(vector-set! sieve index #f)
			(multiples-loop (+ (* 2 index) 1))))))
	    (sieve-loop (+ index 1)))))))