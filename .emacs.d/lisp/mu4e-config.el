;;; mu4e-config.el --- Configuring mu4e mail reader

(require 'mu4e)

(setq mu4e-maildir "~/Maildir/Gmail" ;; top-level Maildir
      mu4e-sent-folder "/sent" ;; folder for sent messages
      mu4e-drafts-folder "/drafts" ;; unfinished messages
      mu4e-trash-folder "/trash" ;; trashed messages
      mu4e-refile-folder "/archive")

(setq mu4e-get-mail-command "offlineimap"
      ;;set this to automatically run offlineimap every 300 seconds
      mu4e-update-interval 300)
(setq mu4e-mu-binary "/usr/local/bin/mu")

;; here we add supercite
;; (load "supercite")
;; (autoload 'sc-cite-original "supercite" nil t)
(add-hook 'mail-citation-hook 'sc-cite-original)


;;; mu4e-config.el ends here
