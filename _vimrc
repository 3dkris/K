set nocompatible
colorscheme badwolf
syntax on
set bs=2
set guioptions -=T
set guioptions -=m
set number
set ruler

call pathogen#infect()

"HOTKEYS
nnoremap <F4> :NERDTreeToggle<CR>
nnoremap <F7> :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
nnoremap <F10> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <F9> :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <F8> :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <M-t> :NERDTreeFocus<CR>

"..
