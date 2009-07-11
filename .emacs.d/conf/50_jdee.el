(add-hook 'after-init-hook
          '(lambda ()
             (load-file "~/.emacs.d/site/cedet/common/cedet.el")
             (add-to-list 'load-path "~/.emacs.d/site/jde/lisp")
             (add-to-list 'load-path "~/.emacs.d/site/elib")
             (require 'jde)))

(add-hook 'jde-mode-hook
          '(lambda ()
             (c-set-offset 'arglist-intro '+)
             (c-set-offset 'arglist-close 0)
             (c-set-offset 'topmost-intro-cont 0)
             (c-set-offset 'func-decl-cont 0)
             (setq indent-tabs-mode nil)))


