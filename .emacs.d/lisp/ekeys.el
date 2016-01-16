;; -*- lexical-binding: t; -*-
;;; ekeys.el --- My key bindings and some aliases 

(global-set-key (kbd "C-c C-o") 'just-one-space)
(global-set-key (kbd "C-x t w") 'doremi-window-width+)
(global-set-key (kbd "<C-M-backspace>") 'backward-kill-sexp)
(global-set-key (kbd "C-c h") 'hyperspec-lookup)
(global-set-key "\C-cp" 'org-pomodoro)
;; Use one of these two commands instead of M-x
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
;; Also unset M-x to use it as a prefix key
;; We can now use "M-x (..)" keybindings for anything
(global-unset-key "\M-x")
;; We need a fast backward-kill-word without having to move our hand
;; all the way to backspace
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
;; End and beginning of buffer with C-x
(global-set-key "\C-xt" 'beginning-of-buffer)
(global-set-key "\C-xe" 'end-of-buffer)
;; regexp searches
(global-set-key "\M-r" 'isearch-backward-regexp)
(global-set-key "\M-s" 'isearch-forward-regexp)
(global-set-key [f5] 'call-last-kbd-macro)
;; set shortcut for query-replace-regexp
(defalias 'qrr 'query-replace-regexp)
(define-key global-map (kbd "C-c d") 'dictionary)
(global-set-key (kbd "C-x p") 'ace-window)
(global-set-key (kbd "<f6>") 'spray-mode)
(global-set-key (kbd "C-c C-l") 'locked-buffer-mode)
;; Wrapper for 'other-window'.
;; We want "C-u C-x o" to move window counter-clockwise instead of
;; moving forward 4 windows (default universal-argument)
(defun my-other-window (&optional COUNT &rest args)
  ;; Used to check if [universal-argument] (C-u) was passed as
  ;; argument. If it was, COUNT will be '(4)
    (interactive "P")
  (cond ((consp COUNT) (apply 'other-window -1 args))
	((numberp COUNT) (apply 'other-window COUNT args))
	(t (apply 'other-window 1 args))))
(global-set-key (kbd "C-x o") 'my-other-window)

;; Here we define commands for switching to specific buffers.
;; This function will, given argument "buffer", return a function
;; that switches to that given buffer
(defun switch-to-named-buffer (buf)
  #'(lambda (&optional prefix)
      (format "Switch to buffer: %s" buf)
      (interactive "P")
      (if prefix
	  (switch-to-buffer-other-window buf)
	(switch-to-buffer buf))))
;; We use the prefix "C-c o", "o" for "open" (or "quit"--quit-other-window)
;; Switch to scratch buffer.
(defalias 'switch-to-scratch (switch-to-named-buffer "*scratch*"))
(global-set-key (kbd "C-c o t") 'switch-to-scratch)
;; Switch to shell
(defalias 'switch-to-shell (switch-to-named-buffer "*eshell*"))
(global-set-key (kbd "C-c o s") 'switch-to-shell)
;; Quit other window
;; We use this to close *Help* buffers opened in the neighboring window
(defun quit-other-window (&optional arg)
  (interactive "P")
  (let ((window (next-window)))
    (quit-window nil window)))
(global-set-key (kbd "C-c o q") 'quit-other-window)
  

;; Insert quotation marks around a sexp
(global-set-key "\M-'" 'insert-quotations)
(global-set-key "\M-\"" 'insert-quotes)

;; the '*' in "*P" signals an error if buffer is read-only
(defun insert-quotations (&optional arg)
  "Enclose following ARG sexps in quotation marks.
Leave point after open-quotation."
  (interactive "*P")
  (print arg)
  (insert-pair arg ?\' ?\'))

(defun insert-quotes (&optional arg)
  "Enclose following ARG sexps in quotes.
Leave point after open-quote."
  (interactive "*P")
  (insert-pair arg ?\" ?\"))

(defun display-current-buffer-other-frame (&optional arg)
  (interactive "P")
    (let ((buf (current-buffer)))
      (funcall 'display-buffer-other-frame buf)))
(global-set-key "\C-x5=" 'display-current-buffer-other-frame)
;;; ekeys.el ends here
