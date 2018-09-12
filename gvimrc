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

echo g:os

if has("gui_running")
    if g:os == "Darwin"
		echo "gui_macvim GUI system!!!!"
	    set guifont=Monaco:h17

    elseif g:os == "Linux"
        echo "Linux GUI system!"
        set gfn=Monospace\ 13

    elseif g:os == "Windows"
        echo "windows GUI system!"
        set guifont=Consolas:h16:cDEFAULT
        set guifontwide=NSimsun:h14
    endif
endif
