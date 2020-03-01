set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
 
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
 
 
"设置文件的代码形式 utf8
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese
 
"vim的菜单乱码解决
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
 
"vim提示信息乱码的解决
language messages zh_CN.utf-8

"set guifont=Courier_New:h12
set guifont=Consolas:h12
 
filetype on
filetype plugin indent on
colorscheme torte
set helplang=cn		"设置中文帮助
set history=500		"保留历史记录
set tabstop=4		"设置tab的跳数
set expandtab
set backspace=2 	"设置退格键可用
set wrap 		"设置自动换行
"set nowrap 		"设置不自动换行
set linebreak 		"整词换行，与自动换行搭配使用
"set list 		"显示制表符
set autochdir 		"自动设置当前目录为正在编辑的目录
set scrolloff=5 	"在光标接近底端或顶端时，自动下滚或上滚
set showtabline=2 	"设置显是显示标签栏
set autoread 		"设置当文件在外部被修改，自动更新该文件
set ignorecase
set softtabstop=4     
set shiftwidth=4     
set expandtab       
set mouse=a 		"设置在任何模式下鼠标都可用
set nobackup 		"设置不生成备份文件
set noundofile
"===========================
"查找/替换相关的设置
"===========================
set hlsearch "高亮显示查找结果
set incsearch "增量查找
 
"===========================
"状态栏的设置
"===========================
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] "显示文件名：总行数，总的字符数
set ruler "在编辑过程中，在右下角显示光标位置的状态行
 
"===========================
"代码设置
"===========================
syntax enable "打开语法高亮
syntax on "打开语法高亮
"set showmatch "设置匹配模式，相当于括号匹配
set smartindent "智能对齐
set autoindent "设置自动对齐
set ai! "设置自动缩进
"set cursorcolumn "启用光标列
"set cursorline "设置高亮当前行(这里我注释了)
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"set fdm=indent "
set number 
set noswapfile
set nofoldenable 

call plug#begin('$Vim\vimfiles\plug\')
    Plug 'scrooloose/nerdtree'
    Plug 'plasticboy/vim-markdown'
    Plug 'vim-latex/vim-latex'
call plug#end()


autocmd GUIEnter * simalt ~x
autocmd VimEnter *  NERDTree
nmap <C-U> :call CompileRun()<CR>
nmap <C-N> :w<CR>:!mingw32-make<CR>

func! CompileRun()
    exec 'update' 
    if &filetype == 'c' 
        exec '!gcc % -o %<.exe -Wall'
        exec '!%<.exe'
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<.exe -Wall'
        exec '!%<.exe'
    elseif &filetype == 'python'
        exec '!python %'
    elseif &filetype == 'markdown'
        exec 'silent !start %:p'
    elseif &filetype == 'java'
        exec '!javac %'
    elseif &filetype == 'tex'
        exec '!pdflatex %'
        "exec '!texworks %<.pdf' the command will run only once so do it
        "manually. 
    elseif &filetype == 'plaintex'
        exec '!pdflatex %'
    "comment the following two lines if
    "arduino is not needed. 
    elseif &filetype == 'arduino'
        exec '!d:/arduino/arduino --upload %'
    elseif &filetype =='go'
        exec '!go build %'
        exec '!%<.exe'
    endif                                                                              
endfunc 

