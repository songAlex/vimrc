
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif


" do stuff under windows "
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin




" set color
"colorscheme wombat
colorscheme one
set background=dark

set nocompatible

"search
set is		"increase search
set ic		"ignore case
set hls

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


" \tn \tl
nmap <Leader>tn :tabnew<return>
nmap <Leader>tc :tabclose<return>
" switch to last opened tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" add date and time
if g:os == "Darwin"
	inoremap <C-l> <Esc>o<Esc>!!date<return>:s/ //g<return>f年r-f月r-f日DkJ/asdf<return>
	noremap <C-l> <Esc>o<Esc>!!date<return>:s/ //g<return>f年r-f月r-f日DkJ/asdf<return>
	" cd to default directory
	cd /Users/sj/notesJd

	" tab, if the karabiner is net to C-n for tab switch
	" noremap <C-Tab>	gt
	" noremap <C-S-Tab>	gT

elseif g:os == "Linux"
	noremap <C-l> <Esc>o<Esc>!!date -I<return>kJ
	inoremap <C-l> <Esc>o<Esc>!!date -I<return>kJ
	cd ~/notes

elseif g:os == "Windows"
	" config for mac win virtual 
	noremap <C-l> <Esc>o<Esc>!!date /t<return>kJ
	inoremap <C-l> <Esc>o<Esc>!!date /t<return>kJ
	cd ~/notesJd

endif

noremap <C-N>	gt
noremap <C-P>	gT


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
abbr waht what



" Macro, add 0x, to binary string
let @q = 'i0xlla, l'

" macro, auto add the line number
"1. need to mannually input the first line number
"2. 3@w, auto change the following lines
let @w = '^yWjP^	'


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
"noremap <A-u> copy till $
noremap ç v$"+y
" keep replace the searched word with yanked word
" A-r
noremap ò viw"0p

"copy current file path
"alt 9
noremap ¹ :let @+=expand("%")<enter>

if g:os == "Darwin"
noremap π "0p
noremap ¥ viw"+y
noremap ç v$"+y
noremap ® viw"0p
noremap ª :let @+=expand("%")<enter>
endif

" for blog menu
"noremap <C-h> yyq/p<enter>
noremap <C-h> 0f[lyt]q/p<enter>


" alt 0
noremap ° :set tw=0<enter>

" close tab
noremap <C-w> :q<enter>


" only check the English word
autocmd FileType tex setlocal spell spelllang=en_us


vnoremap ˜ :let i=1|'<,'>g/^/s/^/\=i.". "/|let i=i+1

# supporting swift syntax 
execute pathogen#infect()
