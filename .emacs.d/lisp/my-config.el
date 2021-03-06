;;; my-config.el --- My one-off emacs configurations.

(global-hungry-delete-mode)

(load-theme 'tango)

;; For appointments and reminders
(appt-activate t)

(bbdb-initialize 'anniv)

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;;http://emacswiki.org/emacs/ELPA
;;Add third-party package archive repositories
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

;;Not sure if I need this since installed from Emacs Package Manager
(yas-global-mode 1)

;;workaround since auto-complete mode didn't seem to start automatically
(add-hook 'prog-mode-hook 'auto-complete-mode)
;; superword
(add-hook 'prog-mode-hook 'superword-mode)
(add-hook 'prog-mode-hook 'hs-minor-mode)

(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'prog-mode-hook 'auto-fill-mode)
;; This will only fill comments in prog-mode.
(setq comment-auto-fill-only-comments t)

(require 'ido)
(ido-mode t)

;; fix pdflatex links that were broken in El Capitan upgrade to MacOsX
(setenv "PATH" "/usr/local/bin:/Library/TeX/texbin/:$PATH" t)

(add-hook 'find-file-hook 'auto-insert)


;;Setting chinese input for certain files
(defun my-chinese-setup ()
  "Whenever \"chinese-questions.org\" is opened, set input method to
chinese-py. All other org files are opened with japanese as input method."
  (if (equal (buffer-file-name)
	     "/Users/samlaf/org/chinese-questions.org")
      (progn (set-input-method 'chinese-py)
	     (deactivate-input-method))
    (set-input-method 'japanese)
    (deactivate-input-method)))
(add-hook 'text-mode-hook
	  'my-chinese-setup)

(setq calendar-latitude 45.5)
(setq calendar-longitude -73.6)
(setq calendar-location-name "Montreal, QC")

;; FIXME
;; Should be able to only set source-directory, but it seems that
;;find-function-C-source-directory is defined before .emacs is loaded,
;;hence it doesn't see that source-directory was defined.
(setq source-directory "/Applications/Emacs.app/Contents/Resources")
(setq find-function-C-source-directory "/Applications/Emacs.app/Contents/Resources/src/")

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)




;;Specify email address
(setq user-mail-address "samlaf92@gmail.com")

;;move between windows with S-<left>/<right>/<up>/<down>
(windmove-default-keybindings)



(define-minor-mode locked-buffer-mode
"Make the current window always display this buffer."
nil " locked" nil
(set-window-dedicated-p (selected-window) locked-buffer-mode))


;;; my-config.el ends here
