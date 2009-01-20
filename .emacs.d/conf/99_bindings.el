; C-h必須
(global-set-key "\C-h" 'delete-backward-char)

; dabbrev
(global-set-key "\M-i" 'dabbrev-expand)

; なんかいろいろ
(global-set-key "\C-cu" 'w3m-browse-url)
(global-set-key "\C-cr" 'replace-string)
(global-set-key "\C-c\C-r" 'recentf-open-files)
(global-set-key "\C-c\C-y" 'browse-kill-ring)

;; C-t is other-window
(global-set-key "\C-t" 'other-window)

;; key-chord
(require 'key-chord)
(key-chord-mode 1)

(defadvice toggle-input-method
        (around toggle-input-method-around activate)
        (let ((input-method-function-save input-method-function))
          ad-do-it
          (setq input-method-function input-method-function-save)
          (key-chord-mode (if current-input-method 0 1))))

(key-chord-define-global "vl" (lambda ()
                                (interactive)
                                (do-applescript "activate application \"VLC\"
                                                 activate application \"Emacs\"")))

(key-chord-define-global "v7" (lambda ()
                                (interactive)
                                (set-frame-parameter nil 'alpha 70)))
(key-chord-define-global "v8" (lambda ()
                                (interactive)
                                (set-frame-parameter nil 'alpha 80)))
(key-chord-define-global "v9" (lambda ()
                                (interactive)
                                (set-frame-parameter nil 'alpha 90)))
(key-chord-define-global "v0" (lambda ()
                                (interactive)
                                (set-frame-parameter nil 'alpha 95)))

