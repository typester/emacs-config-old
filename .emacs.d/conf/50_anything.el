; anything
(require 'anything-config)
(require 'anything)

(global-set-key "\C-xb" 'anything)

(define-key anything-map (kbd "C-M-n") 'anything-next-source)
(define-key anything-map (kbd "C-M-p") 'anything-previous-source)
(define-key anything-map (kbd "L") 'anything-execute-persistent-action)

;; anything-match-plugin
(require 'anything-match-plugin)

;; anything-complete
(require 'anything-complete)
;; Automatically collect symbols by 150 secs
(anything-lisp-complete-symbol-set-timer 150)
;; replace completion commands with `anything'
(anything-read-string-mode 0)
(global-set-key "\M-x" 'anything-execute-extended-command)

;; anything-grep
(require 'anything-grep)

(setq anything-grep-alist
    ;; 全バッファのファイル名においてegrepをかける。moccurの代わり。
  '(("buffers" ("egrep -Hin %s $buffers" "/"))
    ;; ~/memo 以下から再帰的にegrepをかける。不要なファイルは除かれる。
    ("catalyst" ("ack -af | xargs egrep -Hin %s" "~/tmp/cpan/Catalyst-Runtime-5.71000"))
    ("ark" ("ack -af | xargs egrep -Hin %s" "~/dev/Ark"))
    ))

;; anything-moccur
;; http://d.hatena.ne.jp/IMAKADO/20080724/1216882563
(require 'color-moccur)
(setq moccur-split-word t)
(when (require 'migemo nil t)
  (setq moccur-use-migemo t))

(require 'anything-c-moccur)
(setq anything-c-moccur-anything-idle-delay 0.2 ;`anything-idle-delay'
      anything-c-moccur-higligt-info-line-flag t ; `anything-c-moccur-dmoccur'などのコマンドでバッファの情報をハイライトする
      anything-c-moccur-enable-auto-look-flag t ; 現在選択中の候補の位置を他のwindowに表示する
      anything-c-moccur-enable-initial-pattern t) ; `anything-c-moccur-occur-by-moccur'の起動時にポイントの位置の単語を初期パターンにする

(global-set-key (kbd "M-o") 'anything-c-moccur-occur-by-moccur) ;バッファ内検索
(global-set-key (kbd "C-M-o") 'anything-c-moccur-dmoccur) ;ディレクトリ
(add-hook 'dired-mode-hook ;dired
          '(lambda ()
             (local-set-key (kbd "O") 'anything-c-moccur-dired-do-moccur-by-moccur)))

(setq anything-sources (list anything-c-source-buffers
                             anything-c-source-recentf
                             anything-c-source-bookmarks
                             anything-c-source-man-pages
                             anything-c-source-file-name-history
                             anything-c-source-locate
                             anything-c-source-complex-command-history
                             anything-c-source-emacs-commands
                             anything-c-source-emacs-functions
                             anything-c-source-buffer-not-found))
