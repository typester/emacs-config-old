; Outline-minor-mode key map
(define-prefix-command 'cm-map nil "Outline-")
; HIDE
(define-key cm-map "q" 'hide-sublevels)    ; Hide everything but the top-level headings
(define-key cm-map "t" 'hide-body)         ; Hide everything but headings (all body lines)
(define-key cm-map "o" 'hide-other)        ; Hide other branches
(define-key cm-map "c" 'hide-entry)        ; Hide this entry's body
(define-key cm-map "l" 'hide-leaves)       ; Hide body lines in this entry and sub-entries
(define-key cm-map "d" 'hide-subtree)      ; Hide everything in this entry and sub-entries
; SHOW
(define-key cm-map "a" 'show-all)          ; Show (expand) everything
(define-key cm-map "e" 'show-entry)        ; Show this heading's body
(define-key cm-map "i" 'show-children)     ; Show this heading's immediate child sub-headings
(define-key cm-map "k" 'show-branches)     ; Show all sub-headings under this heading
(define-key cm-map "s" 'show-subtree)      ; Show (expand) everything in this heading & below
; MOVE
(define-key cm-map "u" 'outline-up-heading)                ; Up
(define-key cm-map "n" 'outline-next-visible-heading)      ; Next
(define-key cm-map "p" 'outline-previous-visible-heading)  ; Previous
(define-key cm-map "f" 'outline-forward-same-level)        ; Forward - same level
(define-key cm-map "b" 'outline-backward-same-level)       ; Backward - same level

(global-set-key "\C-o" cm-map)



;; cperl mode
(defmacro join (join-char &rest others) `(mapconcat 'identity ',others ,join-char))

(setq my-cperl-outline-regexp
      (concat
       "^"                              ; Start of line
       "[ \\t]*"                        ; Skip leading whitespace
       "\\("                            ; begin capture group \1
       (join "\\|"
             "=head[12]"                  ; POD header
             "package"                    ; package
             "=item"                      ; POD item
             "sub"                        ; subroutine definition
             "has"                        ; Moose attributes
             "before" "after" "around"    ; Moose method attributes
           )
       "\\)"                            ; end capture group \1
       "\\b"                            ; Word boundary
       ))

(add-hook 'cperl-mode-hook '(lambda ()
                              (outline-minor-mode 1)
                              (setq outline-regexp my-cperl-outline-regexp)
                              (setq outline-regexp cperl-outline-regexp)))
