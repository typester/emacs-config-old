;; i <3 bitmap font
(setq mac-allow-anti-aliasing nil)

(create-fontset-from-fontset-spec
 (concat
  "-*-fixed-medium-r-normal--12-*-*-*-*-*-fontset-monaco"
  ",ascii:-apple-monaco-medium-r-normal--12-120-72-72-m-120-*-*"
  ",japanese-jisx0208:-apple-ヒラギノ角ゴ pro w3-*"
  ",katakana-jisx0201:-apple-ヒラギノ角ゴ pro w3-*"))

(create-fontset-from-fontset-spec
 (concat
  "-*-fixed-medium-r-normal--10-*-*-*-*-*-fontset-tobi"
  ",ascii:-apple-codingfonttobi-medium-r-normal--16-120-72-72-m-120-*-*"
  ",japanese-jisx0208:-apple-osaka-*"
  ",katakana-jisx0201:-apple-osaka-*"
  ",chinese-big5-1:-apple-apple ligothic medium-*"
  ))

(create-fontset-from-fontset-spec
 (concat
  "-*-fixed-medium-r-normal--10-*-*-*-*-*-fontset-proggy"
  ",ascii:-apple-proggycleanttsz-medium-r-normal--16-120-72-72-m-120-*-*"
  ",japanese-jisx0208:-apple-osaka-*"
  ",katakana-jisx0201:-apple-osaka-*"
  ",chinese-big5-1:-apple-apple ligothic medium-*"
))

(set-default-font "fontset-tobi")
