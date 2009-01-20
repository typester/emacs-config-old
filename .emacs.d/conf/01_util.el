;; カーソル位置のフェースを調べる関数
(defun describe-face-at-point ()
  "Return face used at point."
  (interactive)
  (message "%s" (get-char-property (point) 'face)))

;; 日付挿入 (Changesとかで使う)
(defun my-insert-date ()
  (interactive)
  (insert (format-time-string "%Y-%m-%dT%R:%S+09:00" (current-time))))

(global-set-key "\C-cd" 'my-insert-date)
