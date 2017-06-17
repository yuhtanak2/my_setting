set t_Co=256
set title
set ambiwidth=double
set tabstop=4
set expandtab
set shiftwidth=4
set nrformats-=octal
set hidden
set history=50
set virtualedit=block
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set wildmenu
set paste
set nu

augroup FileTypeAu
    autocmd!
    autocmd BufWritePre *.php call RTrim()
augroup END
function! RTrim()
    %s/\s\+$//e
endfunction

syntax enable
