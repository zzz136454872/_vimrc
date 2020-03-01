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
 
 
"�����ļ��Ĵ�����ʽ utf8
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese
 
"vim�Ĳ˵�������
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
 
"vim��ʾ��Ϣ����Ľ��
language messages zh_CN.utf-8

"set guifont=Courier_New:h12
set guifont=Consolas:h12
 
filetype on
filetype plugin indent on
colorscheme torte
set helplang=cn		"�������İ���
set history=500		"������ʷ��¼
set tabstop=4		"����tab������
set expandtab
set backspace=2 	"�����˸������
set wrap 		"�����Զ�����
"set nowrap 		"���ò��Զ�����
set linebreak 		"���ʻ��У����Զ����д���ʹ��
"set list 		"��ʾ�Ʊ��
set autochdir 		"�Զ����õ�ǰĿ¼Ϊ���ڱ༭��Ŀ¼
set scrolloff=5 	"�ڹ��ӽ��׶˻򶥶�ʱ���Զ��¹����Ϲ�
set showtabline=2 	"����������ʾ��ǩ��
set autoread 		"���õ��ļ����ⲿ���޸ģ��Զ����¸��ļ�
set ignorecase
set softtabstop=4     
set shiftwidth=4     
set expandtab       
set mouse=a 		"�������κ�ģʽ����궼����
set nobackup 		"���ò����ɱ����ļ�
set noundofile
"===========================
"����/�滻��ص�����
"===========================
set hlsearch "������ʾ���ҽ��
set incsearch "��������
 
"===========================
"״̬��������
"===========================
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] "��ʾ�ļ��������������ܵ��ַ���
set ruler "�ڱ༭�����У������½���ʾ���λ�õ�״̬��
 
"===========================
"��������
"===========================
syntax enable "���﷨����
syntax on "���﷨����
"set showmatch "����ƥ��ģʽ���൱������ƥ��
set smartindent "���ܶ���
set autoindent "�����Զ�����
set ai! "�����Զ�����
"set cursorcolumn "���ù����
"set cursorline "���ø�����ǰ��(������ע����)
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

