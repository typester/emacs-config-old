;; フルスクリーントグル
(defun my-mac-toggle-max-window ()
  (interactive)
  (if (frame-parameter nil 'fullscreen)
      (set-frame-parameter nil 'fullscreen nil)
    (set-frame-parameter nil 'fullscreen 'fullboth)))

(global-set-key (kbd "M-<RET>") 'my-mac-toggle-max-window)


;; アンチエイリアストグル
(defun my-mac-toggle-antialias ()
  (interactive)
  (if mac-allow-anti-aliasing
      (setq mac-allow-anti-aliasing nil)
    (setq mac-allow-anti-aliasing t)))

