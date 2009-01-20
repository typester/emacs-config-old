(require 'anything-project)
(global-set-key (kbd "C-c b") 'anything-project)

;; ignore blib for perl project
(ap:add-project :name 'perl :look-for '("Makefile.PL" "Build.PL") :exclude-regexp '("/blib"))
