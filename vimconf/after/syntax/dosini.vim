syn region dosiniSection start="^\[" end="\(\[\)\@=" contains=dosiniLabel,dosiniHeader,dosiniComment keepend fold
setlocal foldmethod=syntax
" Following opens all folds (remove line to start with folds closed).
setlocal foldlevel=20
setlocal foldtext=getline(v:foldstart)
