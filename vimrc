
syntax on

highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

autocmd ColorScheme * highlight WhitespaceEOL ctermbg=red guibg=red

colorscheme molokai
set background=dark
set gfn=Consolas\ 9

let mapleader = ","

set autowrite
set autowriteall
set nolinebreak
set fileencoding=utf-8
set fileencodings=utf-8
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set smartindent
set autoindent
set incsearch
set ruler

set lines=75
set history=1000

set hlsearch
set incsearch
set showmatch
set foldmethod=indent
set number
set nofoldenable    " disable folding

filetype on
filetype plugin on

" Highlight end of line whitespace.
nnoremap <F6> :!/opt/local/bin/ctags -R --python-kinds=-i *.py<CR>
" set tags+=$HOME/.vim/tags/python27.ctags
nnoremap <F4> :TagbarToggle<CR>
nnoremap <F6> :SyntasticCheck<CR>
nnoremap <F1> :w<CR>
vmap r "_dP 

autocmd BufRead,BufNewFile *.py     setfiletype python
au BufEnter *.py set textwidth=79

" More syntax highlighting.
let python_highlight_all = 1

" `gf` jumps to the filename under the cursor.  Point at an import statement
" and jump to it!
python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

" Use :make to see syntax errors. (:cn and :cp to move around, :dist to see
" all errors)
set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" Execute a selection of code (very cool!)
" Use VISUAL to select a range and then hit ctrl-h to execute it.
python << EOL
import vim
def EvaluateCurrentRange():
    eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOL
map <C-h> :py EvaluateCurrentRange()<cr>

autocmd FileType python set complete+=k~/.vim/syntax/python.vim
autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType python set tags+=~/.vim/tags/python.tags
autocmd FileType python set tags+=~/PROJEKTY/IK-NEW/production/tags
autocmd FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python set cc=80
autocmd FileType python set ft=python.django
autocmd FileType python set lbr

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType html set ft=htmldjango
autocmd FileType html set lbr

autocmd FileType ruby set lbr

autocmd FileType css set omnifunc=csscomplete#CompleteCSS

set formatoptions=l
set lbr

inoremap <C-space> <C-x><C-o>
nnoremap <C-f><C-f> :FufFileWithCurrentBufferDir<CR>
" nnoremap <C-f><C-f> :FufFile<CR>
nnoremap <C-d><C-d> :FufBuffer<CR>
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <silent> tn :tabnew<CR>
nnoremap <silent> tc :tabclose<CR>
nnoremap <silent> t1 :tabprevious<CR>
nnoremap <silent> t2 :tabnext<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.orig']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let Tlist_Use_Right_Window = 1

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Right> <nop>
noremap <Left> <nop>

" ---------------
" Backups
" ---------------
set backup        " keep a backup file
set backupdir=~/.vimbackup,/tmp
set directory=~/.vimbackup//,/tmp//
" Ropevim
" Pathogen load
filetype off

call pathogen#infect()
" call pathogen#helptags()

filetype plugin indent on
syntax on
" pymode - wylacza pylint przy zapisie
let g:pymode_lint_write = 0
" wylacza scrollbar z vim
set guioptions+=LlRrb
set guioptions-=LlRrb
" cursorline
set cursorline
" wylaczenie casesensitive w search
set ignorecase

autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

nnoremap <F5> :GundoToggle<CR>

" Jeżeli wyszukałeś jakąś frazę, to vim ją podkreślił, jeśli chcesz pozbyć się podświetlenia wciśnij CTRL+n.
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>
" Szybki zapis pliku, CTRL+z. "
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>
set noswapfile

" Pierwsza linijka ustawia pod skrótem ",g" wywołanie RopeGotoDefinition... Jeżeli zapomniałeś czegoś na temat danego obiektu albo chcesz się dowiedzieć czegoś nowego na jego temat to wskazujesz na niego, wciskasz ",g" i przenosi cię do pliku w którym jest zaimplementowany.
" Druga włącza obsługę skrótów.
" W trzeciej przekazujesz w jaki sposób ma się wyświetlać okno, po znalezieniu pliku w którym obiekt jest zaimplementowany. W tym przypadku dzieli ekran pionową kreską, przykład:
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_virtualenv = 1

nmap <leader>a <Esc>:Ack!
" Remove Trailing Whitespace
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

let g:user_emmet_leader_key='<C-y>'
