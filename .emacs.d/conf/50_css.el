(require 'css-mode)
(add-to-list 'auto-mode-alist '("\\.css" . css-mode))

(setq cssm-indent-function #'cssm-c-style-indenter)

;(mmm-add-classes
; '((embedded-css
;    :submode css-mode
;    :front "<style[^>]*>"
;    :back "</style>")))
;
;(mmm-add-mode-ext-class 'nxml-mode nil 'embedded-css)
