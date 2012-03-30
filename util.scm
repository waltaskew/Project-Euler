(define nil '())
(define call/cc call-with-current-continuation)

;;; return a list of all items from a given list
;;; which pass through the given filter
(define (filter filter? lst)
  (let do-filter ((cur-list lst)
		  (filtered-list nil))
    (if (null? cur-list)
	(reverse filtered-list)
	(let ((item (car cur-list)))
	  (if (filter? item)
	      (do-filter (cdr cur-list)
			 (cons item filtered-list))
	      (do-filter (cdr cur-list)
			 filtered-list))))))

;;; returns x squared
(define (square x)
    (* x x))