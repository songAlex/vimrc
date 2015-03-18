" display format
set tabstop=4
set smartindent
set number
set shiftwidth=4
" no tool bar
set guioptions-=T

" no auto wrap
set textwidth=0 
set wrapmargin=0 

" chinese char supports
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc


"fonts 
let myos = substitute(system('uname -o'), "\n", "", "")
if myos == "GNU/Linux"
set hls
"set guifont=Monaco:h11
set gfn=Monospace\ 18

else
set guifont=Consolas:h20:cDEFAULT

endif

set guifontwide=NSimsun:h20
