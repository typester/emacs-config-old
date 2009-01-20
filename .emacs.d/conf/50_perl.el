(defalias 'perl-mode 'cperl-mode)
(setq cperl-indent-level 4)
(setq cperl-continued-statement-offset 4)
(setq cperl-brace-offset -4)
(setq cperl-label-offset -4)
(setq cperl-indent-parens-as-block t)
(setq cperl-close-paren-offset -4)
(setq cperl-tab-always-indent t)
;(setq cperl-electric-parens t) ; 対応する括弧自動挿入 うざい
;(setq cperl-invalid-face nil)
(setq cperl-highlight-variables-indiscriminately t)

; steal from perlhacks
(global-set-key "\M-p" 'cperl-perldoc)

(add-hook 'cperl-mode-hook '(lambda ()
                              (setq indent-tabs-mode nil)
                              ; BestPractices からぱくったがなんかうごいてない
                              (setq fill-column 78)
                              (setq auto-fill-mode t)
                              ; face設定。これはどっかちがうとこにうつす
                              (set-face-background 'cperl-hash-face (face-background 'default))
                              (setq cperl-hash-face 'cperl-hash-face)
                              ;(make-face 'cperl-array-face)
                              ;(set-face-foreground 'cperl-array-face "color-69")
                              (set-face-background 'cperl-array-face (face-background 'default))
                              (setq cperl-array-face 'cperl-array-face)
                              ))
                              

; from Best Practices
; Use % to match various kinds of brackets...
;(defun match-paren (arg)
;  "Go to the matching paren if on a paren; otherwide insert %."
;  (interactive "p")
;  (let ((prev-char (char-to-string (preceding-char)))
;	(next-char (char-to-string (following-char))))
;    (cond ((string-match "[[{(<]" next-char) (forward-sexp 1))
;	  ((string-match "[\]})>" prev-char) (backward-sexp 1))
;	  (t (self-insert-command (or arg 1))))))
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))
(global-set-key "%" 'match-paren)


; perl tidy
(defun perltidy-region ()
  "Run perltidy on the current region."
  (interactive)
  (save-excursion
    (shell-command-on-region (point) (mark) "perltidy -q" nil t)))
(defun perltidy-defun ()
  "Run perltidy on the current defun."
  (interactive)
  (save-excursion (mark-defun)
  (perltidy-region)))

;; perl completion
;(add-to-list 'load-path "~/.emacs.d/elisp/perl-completion")
;(add-hook 'cperl-mode-hook (lambda ()
;                             (require 'perl-completion)
;                             (perl-completion-mode t)))

(add-hook  'cperl-mode-hook (lambda ()
                              (require 'auto-complete)
                              (require 'perl-completion)
                              (add-to-list 'ac-sources 'ac-source-perl-completion)
                              (perl-completion-mode t)))

(global-set-key "\C-ct" 'perltidy-region)
(global-set-key "\C-c\C-t" 'perltidy-defun)

(add-to-list 'auto-mode-alist '("\\.t$" . perl-mode))
