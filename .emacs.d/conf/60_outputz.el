(require 'outputz)

;; pit
(let* ((conf (pit/get 'outputz.com))
       (key (cdr (assoc 'key conf))))
  (or key (error "Required \"outputz.com\" => \"key\" entry in your pit config"))
  (setq outputz-key key)
  (setq outputz-uri "emacs://%s/")
  (global-outputz-mode t))
