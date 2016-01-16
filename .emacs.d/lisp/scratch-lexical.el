;; -*- lexical-binding: t -*-


(catch 'tag
  (foo))

(defun foo ()
  (throw 'tag '))

(lambda (x) (* x x))
(a 3)
