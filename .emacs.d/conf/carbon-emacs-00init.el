;; customize 保存用ファイル
(setq custom-file "~/.emacs.d/conf/carbon-emacs-99customize.el")

;; color-theme
(require 'color-theme)
(color-theme-initialize)
;(color-theme-arjen)                     ; costomizeで微調整
(color-theme-calm-forest)

;; フルスクリーン時用に時刻表示する
(setq display-time-string-forms '((format-time-string "%H:%M" now)))
(display-time)

