function! YankMatches(pattern)
  " 清空系统剪贴板
  let @+ = ""
  " 使用 vimgrep 搜索匹配项并存入快速列表
  silent! execute 'vimgrep /'.a:pattern.'/ %'
  " 获取快速列表内容
  let matches = getqflist()
  " 检查是否有匹配项
  if empty(matches)
    echo "No matches found for pattern: " . a:pattern
    return
  endif
  " 遍历快速列表，提取每一行中的匹配内容并追加到剪贴板
  for match in matches
    " 提取当前行中匹配的内容
    let match_text = matchstr(match["text"], a:pattern)
    " 将匹配的内容追加到剪贴板
    let @+ .= match_text . "\n"
  endfor
  " 提示复制成功
  echo "Matches copied to clipboard."
endfunction
nnoremap <leader>,s :call YankMatches('')<left><left>
let mapleader=" "
" defualt dir
"cd D:\myCode\matMag
" setup gui
set tabstop=4 shiftwidth=4 softtabstop=4
set rnu nu expandtab wrap showcmd wildmenu hlsearch cursorline cursorcolumn
set incsearch ignorecase smartcase nocompatible backspace=indent,eol,start
colorscheme torte 
set guifont=仿宋:h14
" normal mode setup
"e:xec "nohlsearch"
" shortCut Keys
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
nnoremap <leader>v :edit $MYVIMRC<CR>
nnoremap <leader>/ /<c-r>+.*商务.*2017
"nnoremap <leader>s mm/<c-r><c-w>.*商务.*\t2017\t<cr>
nnoremap <leader>s :vim // %\|copen 15
nnoremap <leader>d yyggP`m+
nnoremap <leader>q :q!<CR>
nnoremap <leader>t :tabnext<CR>
nnoremap <leader>, :cN<CR>
nnoremap <leader>. :cn<CR>
nnoremap \f :so %<CR>
nnoremap \d <esc>ggVG"+yG$<esc>
nnoremap \r 0i"<esc>
nnoremap \e 0x
nnoremap ,y V"+y
nnoremap <leader>,a ggVG
