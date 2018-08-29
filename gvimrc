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

" change cursor color
au InsertLeave * hi Cursor guibg=Seagreen
au InsertEnter * hi Cursor guibg=LightYellow

"fonts 
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

echo g:os

if has("gui_running")
    if g:os == "Darwin"
        set guifont=Fira\ Mono:h12

    elseif g:os == "Linux"
        echo "Linux GUI system!"
        set gfn=Monospace\ 13

    elseif g:os == "Windows"
        echo "windows GUI system!"
        set guifont=Consolas:h16:cDEFAULT
        set guifontwide=NSimsun:h14
    endif
endif

if has("gui_macvim")
  set guifont=Monaco:h13
  echo "gui_macvim GUI system!!!!"
endif

