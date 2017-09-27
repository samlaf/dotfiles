(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-command-extra-options "\"-shell-escape\"")
 '(TeX-engine (quote xetex))
 '(TeX-view-program-list
   (quote
    (("Emacs" "emacsclient %o")
     ("DocView" "(find-file \"%o\")"))))
 '(TeX-view-program-selection
   (quote
    ((output-dvi "open")
     (output-pdf "open")
     (output-pdf "Emacs")
     (output-html "open"))))
 '(browse-url-browser-function (quote eww-browse-url))
 '(canlock-password "3067eb78b721ba3e67dcfe8446e8efc920eaa66e")
 '(current-language-environment "UTF-8")
 '(elpy-rpc-python-command "python")
 '(fortune-dir "~/fortunes/")
 '(fortune-file "~/fortunes/spooks")
 '(icomplete-mode t)
 '(mail-setup-hook nil)
 '(message-send-mail-function (quote smtpmail-send-it))
 '(message-signature
   "Albanian SAPO Israel ammunition IMF Middleman ANC Failure Capricorn
SADF San Diego Jiang Zemin SLIP Ortega Phishing")
 '(org-agenda-custom-commands
   (quote
    (("n" "Agenda and all TODO's"
      ((agenda "" nil)
       (tags-todo "-CATEGORY=\"Habits\"-CATEGORY=\"Projects\"-HOLD-FUTURE" nil)
       (tags-todo "CATEGORY=\"Projects\"" nil))
      nil)
     ("x" "next" todo "NEXT" nil)
     ("l" "List of Suggestions"
      ((tags "CATEGORY=\"Reading\"" nil)
       (tags "CATEGORY=\"Movie\"" nil)
       (tags "CATEGORY=\"Places\"" nil)
       (tags "CATEGORY=\"Buy\"" nil))
      ((org-agenda-files
	(quote
	 ("~/org/lists.org"))))
      nil))))
 '(org-agenda-files (quote ("~/org")))
 '(org-agenda-tags-todo-honor-ignore-options t)
 '(org-agenda-todo-ignore-scheduled (quote future))
 '(org-agenda-todo-ignore-timestamp (quote future))
 '(org-capture-templates
   (quote
    (("t" "todo" entry
      (file "~/org/refile.org")
      "* TODO %?
%U
")
     ("n" "note" entry
      (file "~/org/refile.org")
      "* %? :NOTE:
%U
%a
" :clock-in t :clock-resume t)
     ("o" "Journal" entry
      (file+datetree "~/org/diary.org")
      "* %?
%U
" :clock-in t :clock-resume t)
     ("h" "Habit" entry
      (file+headline "~/org/todo.org" "Habits")
      "* TODO %?
%U
SCHEDULED: %<<%Y-%m-%d %a .+1d/3d>>
:PROPERTIES:
:STYLE: habit
:REPEAT_TO_STATE: NEXT
:END:
")
     ("j" "Japanese" item
      (file+headline "~/org/jap.org" "Questions")
      "")
     ("c" "Chinese" item
      (file+headline "~/org/chinese-questions.org" "Questions")
      "")
     ("k" "Log a new Emacs Key" table-line
      (file+headline "~/org/todo.org" "Emacs keys")
      ""))))
 '(org-drawers
   (quote
    ("PROPERTIES" "CLOCK" "LOGBOOK" "RESULTS" "BRAINSTORM")))
 '(org-enforce-todo-checkbox-dependencies t)
 '(org-enforce-todo-dependencies t)
 '(org-export-backends (quote (ascii beamer html icalendar latex)))
 '(org-feed-alist
   (quote
    (("Lifehacker.jp" "http://feeds.lifehacker.jp/rss/lifehacker/index.xml" "~/org/feeds.org" "ライフハッカー")
     ("Nihongo Juku" "http://feeds.feedburner.com/Nihongo-juku" "~/org/feeds.org" "Nihongo Juku"))))
 '(org-hide-leading-stars t)
 '(org-latex-create-formula-image-program (quote imagemagick))
 '(org-latex-pdf-process
   (quote
    ("pdflatex -interaction nonstopmode -output-directory %o %f" "pdflatex -interaction nonstopmode -output-directory %o %f" "pdflatex -interaction nonstopmode -output-directory %o %f" "pdflatex -shell-escape -output-directory %o %f")))
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m)))
 '(python-shell-buffer-name "Python")
 '(python-shell-interpreter "python3")
 '(quack-default-program "mit-scheme")
 '(quack-programs
   (quote
    ("mzscheme" "bigloo" "csi" "csi -hygienic" "gosh" "gracket" "gsi" "gsi ~~/syntax-case.scm -" "guile" "kawa" "mit-scheme" "racket" "racket -il typed/racket" "rs" "scheme" "scheme48" "scsh" "sisc" "stklos" "sxi")))
 '(scheme-program-name " /usr/local/bin/mit-scheme")
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587)
 '(tab-always-indent (quote complete))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
