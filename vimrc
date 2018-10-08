
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

set nocompatible

set hls


" do stuff under windows "
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin


" taglist
nnoremap <silent> <F12> :TlistToggle<CR>


"let CSCOPE_DB=$WORK/cscope.out
" too slow to load all test, connect to db by hand
"if has("cscope")
"	set csprg=c:/cygwin/bin/cscope.exe
"	set csto=0
"	set cst
"	set nocsverb
"	" add any database in current directory
"	if filereadable("cscope.out")
"		cs add cscope.out
"	" else add database pointed to by environment
"	"elseif $CSCOPE_DB != ""
"	else
"		cs add $WORK/cscope.out
"	endif
"	set csverb
"endif


" google search
" add firefox to path
let $PATH .= ';C:\Program Files (x86)\Mozilla Firefox\'
xnoremap <f1> "zy:!start firefox "http://www.google.com/search?q=<c-r>=substitute(@z,' ','%20','g')<cr>"<return>gv

function! GoogleSearch()
     let searchterm = getreg("g")
     silent! exec "silent! !firefox \"http://google.com/search?q=" . searchterm . "\" &"
endfunction
vnoremap <F6> "gy<Esc>:call GoogleSearch()<CR>



" set color
"colorscheme wombat
colorscheme one
set background=dark

"dictionary
set spell
"set nospell
set spellfile+=~/.vim/spell/en.utf-8.add


" set default op
nmap <enter> i<enter><Esc>
nmap <backspace> X
nnoremap <Tab> >>_
"inoremap <C-backspace> <Esc>diwa
inoremap <C-backspace> <Esc>dbxi
"nnoremap <C-backspace> diw
nnoremap <C-backspace> db


"noremap   <C-t> :tabnew<return>
"noremap   <C-W> :tabclose<return>
nmap <Leader>tn :tabnew<return>
nmap <Leader>tc :tabclose<return>
" switch to last opened tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" add date and time
"noremap <C-l> <Esc>!!date<return>4daWjS
if g:os == "Darwin"
	inoremap <C-l> <Esc>o<Esc>!!date<return>:s/ //g<return>f年r-f月r-f日DkJ/asdf<return>
	noremap <C-l> <Esc>o<Esc>!!date<return>:s/ //g<return>f年r-f月r-f日DkJ/asdf<return>
	" cd to default directory
	cd /Users/sj/notesJd

	" tab
	noremap <C-Tab>	gt
	noremap <C-S-Tab>	gT

elseif g:os == "Linux"
	noremap <C-l> <Esc>o<Esc>!!date -I<return>kJ
	inoremap <C-l> <Esc>o<Esc>!!date -I<return>kJ
	noremap <C-N>	gt
	noremap <C-P>	gT
	cd ~/notes

elseif g:os == "Windows"
	" config for mac win virtual 
	noremap <C-l> <Esc>o<Esc>!!date /t<return>kJ
	inoremap <C-l> <Esc>o<Esc>!!date /t<return>kJ
	cd ~/notesJd

endif

	


" auto correct words
abbr hte the
abbr teh the
abbr adn and
abbr wiht with
abbr ti it
abbr ot to
abbr inot into
abbr fo of
abbr thsi this
abbr wehn when
abbr fro for
abbr fi if
abbr si is
abbr nto not
abbr functoin function



"search
set is		"increase search
set ic		"ignore case


" Macro, add 0x, to binary string
let @q = 'i0xlla, l'


"comments on selected lines
"vnoremap <C-/> I//<Esc>
" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" run command that input in insert mode by mistake
inoremap <F2> <Esc>u@.


" for win32 only, increase the number
noremap <C-I> <C-A>
" for decrease, C-X


" tab new
noremap <C-j> :tabnew  


" open a new line no insert mode
noremap <C-o> o<Esc>


" past the yank data
"noremap <A-p>
noremap ð "0p
noremap π "0p
"noremap <A-y>
noremap ù viw"+y

" for blog menu
"noremap <C-h> yyq/p<enter>
noremap <C-h> 0f[lyt]q/p<enter>

" keep replace the searched word with yanked word
" A-r
noremap ò viw"0p
noremap ® viw"0p

"
"function tw()https://github.com/songAlex/vimrc.git
"	:set tw=0
"endfunction
"noremap ¹ exec tw()
" alt 0
noremap ° :set tw=0<enter>

" close tab
noremap <C-w> :q<enter>


"copy current file path
"alt 9
noremap ¹ :let @+=expand("%")<enter>


" for the cscope :cs add
se csprg=c:\cygwin64\bin\cscope.exe

" only check the English word
autocmd FileType tex setlocal spell spelllang=en_us

