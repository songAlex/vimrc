set nocompatible
let myos = substitute(system('uname -o'), "\n", "", "")
if myos == "GNU/Linux"
set hls
" some windows hot key
" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>		"*p
"map <C-V>		"+gP
map <S-Insert>		"+gP

cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+


elseif myos == "Cygwin"
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

endif


" command config for all OS
" set diffexpr=MyDiff()
" function MyDiff()
"   let opt = '-a --binary '
"   if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"   if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"   let arg1 = v:fname_in
"   if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"   let arg2 = v:fname_new
"   if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"   let arg3 = v:fname_out
"   if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"   let eq = ''
"   if $VIMRUNTIME =~ ' '
"     if &sh =~ '\<cmd'
"       let cmd = '""' . $VIMRUNTIME . '\diff"'
"       let eq = '"'
"     else
"       let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"     endif
"   else
"     let cmd = $VIMRUNTIME . '\diff'
"   endif
"   silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
" endfunction


" set color
colorscheme wombat
"dictionary
set spell
set spellfile+=~/vimfiles/spell/en.utf-8.add


" set default op
nmap <enter> i<enter><Esc>
nmap <backspace> X
nnoremap <Tab> >>_
"inoremap <C-backspace> <Esc>diwa
inoremap <C-backspace> <Esc>dbxi
"nnoremap <C-backspace> diw
nnoremap <C-backspace> db


" tab
noremap <C-N>	gt
noremap <C-P>	gT
"noremap   <C-t> :tabnew<return>
"noremap   <C-W> :tabclose<return>
nmap <Leader>tn :tabnew<return>
nmap <Leader>tc :tabclose<return>
" switch to last opened tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" add date
"noremap <C-l> <Esc>!!date<return>4daWjS
noremap <C-l> <Esc>o<Esc>!!date /t<return>kJ
inoremap <C-l> <Esc>o<Esc>!!date /t<return>kJ


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

" avoid delete overwrite yanked register
"noremap  y "*y
"noremap  Y "*Y
"noremap  p "*p
"noremap  P "*P
"vnoremap y "*y
"vnoremap Y "*Y
"vnoremap p "*p
"vnoremap P "*P


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
"noremap <A-y> 
noremap ù viw"+y

" for blog menu
noremap <C-h> yyq/p<enter>

" keep replace the searched word with yanked word
" A-r
noremap ò viw"0p

"
"function tw()
"	:set tw=0
"endfunction
"noremap ¹ exec tw()
" alt 0
noremap ° :set tw=0<enter>

" close tab
noremap <C-w> :q<enter>


"set to tab as 4 space
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab 
