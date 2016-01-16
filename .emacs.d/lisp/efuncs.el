;;; efuncs.el --- My utility functions           

;; NOTE:: based off of 'find-file' 
(defun my-insert-filename (filename &optional wildcards)
  "insert string FILENAME at point.
Interactively, the default if you just type RET is the current directory,
but the printed file name is available through the minibuffer history."
  (interactive
   (find-file-read-args "Find file: "
			(confirm-nonexistent-file-or-buffer)))
  (insert filename))

;;
;; Never understood why Emacs doesn't have this function.
;;
(defun my-rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME." (interactive "sNew name: ")
  (let ((name (buffer-name))
	(filename (buffer-file-name)))
    (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
	  (message "A buffer named '%s' already exists!" new-name)
	(progn 	 (rename-file name new-name 1)
		 (rename-buffer new-name)
		 (set-visited-file-name new-name)
		 (set-buffer-modified-p nil)))))) ;;
;; Never understood why Emacs doesn't have this function, either.
;;
(defun my-move-buffer-file (dir)
  "Moves both current buffer and file it's visiting to DIR." (interactive "DNew directory: ")
  (let* ((name (buffer-name))
	 (filename (buffer-file-name))
	 (dir
	  (if (string-match dir "\\(?:/\\|\\\\)$")
	      (substring dir 0 -1) dir))
	 (newname (concat dir "/" name)))

    (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
      (progn (copy-file filename newname 1)
	     (delete-file filename)
	     (set-visited-file-name newname)
	     (set-buffer-modified-p nil)
	     t))))



;;; efuncs.el ends here

