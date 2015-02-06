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
"set guifont=Monaco:h11
"set guifont=Consolas:h20:cDEFAULT
set guifont=Consolas:h20:cDEFAULT
set guifontwide=NSimsun:h20


" run command that input in insert mode by mistake
inoremap <F2> <Esc>u@.

" for win32 only, increase the number
noremap <C-I> <C-A>
" for decrease, C-X
