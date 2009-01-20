;; (install-elisp "http://gist.github.com/raw/50900/3e280e57c923b85e31a3db3fea8c0b9335091c97/dopplr.el")

(require 'dopplr)

;; pit
(let* ((conf (pit/get 'dopplr.com))
       (api-token (cdr (assoc 'api-token conf))))
  (if api-token
      (setq dopplr-api-token api-token)
    (error "Required \"dopplr.com\" => \"api-token\" entry in your pit config")))
