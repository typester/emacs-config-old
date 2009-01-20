(require 'cc-mode)

(add-hook 'c-mode-common-hook '(lambda ()
                                 (c-set-offset 'substatement-open 0)
                                 (c-set-offset 'case-label '+)
                                 (c-set-offset 'arglist-cont-nonempty '+)
                                 (c-set-offset 'arglist-intro '+)
                                 (c-set-offset 'topmost-intro-cont '+)
                                 (c-set-offset 'arglist-close 0)
                                 (setq tab-width 4)
                                 (setq c-basic-offset tab-width)
                                 (setq indent-tabs-mode nil)))

