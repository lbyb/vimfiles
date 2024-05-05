
" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction
" default loading
:command! -nargs=1 Rename let tpname = expand('%:t') | saveas <args> | edit <args> | call delete(expand(tpname))
" lightkey set
let mapleader=" "
noremap <LEADER><CR> :nohlsearch<CR>
" defualt dir
"cd D:\myCode\matMag
" setup gui
set tabstop=4
set shiftwidth=4
set softtabstop=4
set rnu nu list expandtab

	colorscheme industry
"	set lines =30 columns =121
	set guifont=Courier_new:h12
" normal mode setup
set wrap
set showcmd
set wildmenu
set hlsearch
"e:xec "nohlsearch"
set incsearch
set ignorecase
set smartcase
set nocompatible
set backspace=indent,eol,start
" shortCut Keys
map R :source ~/.vimrc<CR>
"map c :edit ~/.vimrc<CR>
inoremap ,. <Esc>
"nnoremap ,y "+y<CR>
vnoremap ,y "+y
nnoremap ,p O<c-r>+<esc>
inoremap ,p <c-r>+
cnoremap ,p <c-r>+
vnoremap ,y "+y
vnoremap ,d "+d
nnoremap ,d V"+d
nnoremap ,sss yy+mm/\s<c-r>0<c-h>\s<cr>$?\s<CR>wv$yGp``
nnoremap ,s $?\s<CR>wv$"+ygv
nnoremap ,ss /<c-r>+<CR>$?\s<CR>wv$"+ygv
nnoremap ,rn yyGp/\t<CR>0vndnp2dnndnnDa.pdf<esc>2b<esc>dN2gepwip<esc>:s/\t/-/g<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>h :set hlsearch!<CR>
nnoremap <leader>p :up<CR>
nnoremap <leader>r :source $MYVIMRC<CR>
"nnoremap <leader>v :edit ~\vimfiles\vimrc<CR>
"上面是windows下面的
nnoremap <leader>v :edit ~\.vimrc<CR>
nnoremap <leader>/ /<c-r>+.*商务.*2017
nnoremap <leader>s mm/<c-r><c-w>.*商务.*\t2017\t<cr>
nnoremap <leader>d yyggP`m+
nnoremap <leader>q :q!<CR>
nnoremap \f :so %<CR>
nnoremap \d <esc>ggVG"+yG$<esc>
nnoremap \r 0i"<esc>
nnoremap \e 0x
nnoremap ,y V"+y
