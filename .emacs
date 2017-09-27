;;;
;;; Sam's .emacs file. Loads up lots of libraries.
;;; Template taken from Steve Yegge's .emacs file
;;; https://sites.google.com/site/steveyegge2/my-dot-emacs-file
;;;
;; I use the Common Lisp stuff all the time
(require 'cl)

;; I keep all my emacs-related stuff under ~/emacs
(defvar emacs-root "/Users/samlaf/"
  "My home directory — the root of my personal emacs load-path.")

;; add all the elisp directories under ~/emacs to my load path
(labels ((add-path (p)
		   (add-to-list 'load-path
				(concat emacs-root p))))
  (add-path ".emacs.d/lisp")	      ; all my personal elisp code
  (add-path ".emacs.d/site-lisp")      ; elisp stuff I find on the 'net
  (add-path ".emacs.d/cedet")	       ; CEDET IDE environment
  (add-path "quicklisp")	       ; Library manager for Common Lisp

  (add-path "mu/mu4e/")			; mail reader
  )


;;; We first initialize the packages, and then make sure they are not
;;; again initialized after the init file.
(package-initialize)
(setq package-enable-at-startup' nil)
;;https://github.com/purcell/exec-path-from-shell
;; This sets $MANPATH, $PATH and exec-path from your shell, but only
;; on OS X. To set other environment variables, we call them
;; individually using 'exec-path-from-shell-copy-env.
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "JAVA_HOME")
  (exec-path-from-shell-copy-env "EC2_HOME") ;for AWS CLI tools
  (exec-path-from-shell-copy-env "AWS_ACCESS_KEY")
  (exec-path-from-shell-copy-env "AWS_SECRET_KEY")
  (exec-path-from-shell-copy-env "EC2_URL")
  (exec-path-from-shell-copy-env "GAMBITDIR")
  )



;; I use the same .emacs and elisp files everywhere. I make sure
;; everything works in both GNU Emacs 21.x and XEmacs on various
;; platforms, including native Windows XP, Cygwin on Windows XP,
;; and various flavors of Linux, in windowing and terminal modes.
(load-library "ekeys")	       ; my key bindings and some aliases
(load-library "modes")	       ; configuration for 100-odd emacs modes
(load-library "efuncs")	       ; a bunch of my own utility functions
(load-library "my-config")     ; one-off variable settings
(load-library "kmacros")       ; a bunch of keyboard macros

(load-library "dict-mac")
(load-library "epub-mode")
(load-library "mu4e-config")
(load-library "cedet-devel-load")
(load-library "slime-helper")
(load-library "auto-complete")



;; Save Easy Customizations in a different file, and load them.
(setq custom-file "~/.emacs.d/lisp/.custom.el")
(load custom-file)

;; I always run a shell in Emacs. Always always.
(shell)
(eshell)


;; startup "script" for when we've got a window system
(when (display-graphic-p)
  ;; start gnuserv, so apps can talk to us (e.g. p4, browsers)
  (server-start)

  ;; set the fonts and colors I like
  (global-font-lock-mode t)
  (set-mouse-color "black")
  ;;maximized window frame
  (toggle-frame-maximized))
;;; ---------- COMMENTS/PROBLEMS ---------- ;;;

;;----------------RMAIL---------------;;
;; None of these seems to work.... for some reason
;; Mails fetched to ~/Maildir/Gmail in maildir format using
;; offlineimap, but rmail doesn't seem to be able to read it?
;; hence switched to mu4e
;; (setq rmail-primary-inbox-list
;;        '("//Users/samlaf/Maildir/Gmail/"))


;;; end .emacs 
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
