;; OSを判別
(defvar run-linux
  (equal system-type 'gnu/linux))
(defvar run-darwin
  (equal system-type 'darwin))

;; Windowシステムを判別
(defvar run-cli
  (equal window-system nil))
(defvar run-cocoa
  (equal window-system 'ns))
(defvar run-carbon
  (equal window-system 'mac))

;; スタートアップ時のメッセージを抑制
(setq inhibit-startup-message t)

;; start server
(server-start)

; emacsclient で Buffer `hogehoge' still has clients; kill it? (yes or no) とかいわれるのがうざいのをなおす
; http://aki.issp.u-tokyo.ac.jp/itoh/hiChangeLog/html/2007-04.html#2007-04-09-1
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

;; メニューバーとツールバーoff
(tool-bar-mode 0)
(if (or run-cocoa run-carbon) (menu-bar-mode 1) (menu-bar-mode 0)) ; GUIでは表示

;; ヴィジュアルベル無効
(setq visible-bell nil)

;; ビープ音も無効
(setq ring-bell-function '(lambda ()))

;; 行数、列数を表示
(line-number-mode t)
(column-number-mode t)

;; バックアップしない
(setq make-backup-files nil)

;; 自動保存したファイルを削除する
(setq delete-auto-save-files t)

;; 自動セーブしない
(setq auto-save-default nil)

;; リージョンをC-hで削除
(delete-selection-mode 1)

;; インデントはスペースで
(setq-default indent-tabs-mode nil)

;; C-hでバックスペース
(global-set-key "\C-h" 'delete-backward-char)

;; 初期フレームの大きさ
(setq initial-frame-alist
      (append
       '((width . 130)
         (height . 44))
       initial-frame-alist))
;; 透明度
(modify-frame-parameters (selected-frame) '((alpha  . 95)))

;; スクロールバー非表示
(scroll-bar-mode nil)

;; フリンジ(左右の折り返し表示領域)はいらない
(fringe-mode 'none)

;; 対応する括弧を光らせる
(show-paren-mode 1)

;; 色つける
(global-font-lock-mode t)
(setq-default transient-mark-mode t)
(require 'font-lock)

;; utf-8優先
(prefer-coding-system 'utf-8)

;; 一行ずつスクロール
(setq scroll-step 1)

;; iswitchb & uniquify
(iswitchb-mode 1)
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; 縦分割とかでも行を折り返す
(setq truncate-partial-width-windows nil)

;; カーソル点滅しないように
(blink-cursor-mode 0)

;; アクティブでないバッファではカーソルを出さない
(setq cursor-in-non-selected-windows nil)

;; recenf-mode
(recentf-mode t)
