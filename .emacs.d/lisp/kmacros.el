;; Start a pomodoro clock when there is no previous clock (after
;; restarting emacs, say)

(fset 'my-start-pomodoro
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 98 116 111 100 111 return 24 101 16 3 112 24 left] 0 "%d")) arg)))


