" PLUGINS:
" \_Pathogen
call pathogen#infect()

" \_ NERDTree
let g:NERDTreeChDirMode= 2
let NERDTreeShowBookmarks=1
nnoremap <F4> :NERDTreeToggle<CR>

" \_ CtrlP
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP cd'

" \_Syntastic
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {"mode": "passive"}

let g:syntastic_cpp_cpplint_exec = 'cpplint'
let g:syntastic_cpp_checkers = ['cpplint']

nnoremap <leader>n :lnext<CR>
nnoremap <leader><S-N> :lprevious<CR>
nnoremap <leader>l :SyntasticCheck<CR>
nnoremap <leader><S-l> :SyntasticReset<CR>

" SETTINGS:
"...UI Colors
colorscheme badwolf
syntax on

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
    autocmd WinEnter * set colorcolumn=80
    autocmd WinLeave * set colorcolumn=0
augroup END


"...Auto Complete
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=*.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp,*.pyc
"...backups
set nobackup
set nowritebackup
set directory^=$HOME/vim_swp//

"...Folding
set foldmethod=indent
set foldlevel=99

"...White space, newlines, tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
set smarttab

"...remove trailing white space on lines before saving
autocmd BufWritePre * %s/\s\+$//e

"...Window Setup
set winminwidth=0
set winminheight=0
set guioptions -=T
set guioptions -=m
set number
set ruler


"...Misc
set nocompatible
set bs=2
nmap <Enter> i<Enter><Esc>

"...Allow cursor to go one space past end of line like regular editors
set ve+=onemore


"status line
set laststatus=2
set statusline+=%F

"HOTKEYS:
vmap <c-Backspace> i<Home><backspace><Esc>
imap <c-z> <Esc>ui
nmap <c-z> <Esc>u
imap <c-v> <Esc>"=pi
vmap <c-c> "=y
cmap <c-v> <c-r>"

"...split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"...navigation
nnoremap <m-h> 20h
nnoremap <m-j> 10<c-e>10j
nnoremap <m-k> 10<c-y>10k
nnoremap <m-l> 20l

"...tabbing
imap <tab> <c-t>
imap <S-Tab> <Esc><<i
nmap <Tab> >>
nmap <s-Tab> <<
vmap <Tab> >>gv
vmap <s-Tab> <<gv


"Python Macros:
autocmd FileType python imap <M-v> <Esc>iOOOOOOO = ""; print "\|", OOOOOOO, "=", eval(OOOOOOO), "\| type =", type(eval(OOOOOOO)), "\|"<Esc>20ba
autocmd FileType python map <C-3> I<home>#<Esc>

"C++ Macros:
"autocmd FileType cpp,h,hpp,c,cc,hh imap <M-v> <Esc>iauto *v = ; std::cout << "\|variable = " << " \| type = " << typeid(*v).name() << std::endl;<Esc>0wwwla
"autocmd FileType cpp,h,hpp,c,cc,hh imap <M-v> <Esc>0wy$istd::cout << "OOOOOO: <Esc>pi " << <Esc>pi << "  (type = " << typeid(<Esc>pi).name() << std::endl;<Esc>0wwwla

autocmd FileType cpp,h,hpp,c,cc,hh imap <M-v> <Esc>istd::cout << << "\n";<Esc>
"autocmd FileType cpp,h,hpp,c,cc,hh map <C-3> I//<Esc>
