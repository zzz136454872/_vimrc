# a vim configure file

This is practical vim config file for windows. 

[github.com/zzz136454872/_vimrc](https://github.com/zzz136454872/_vimrc)

## platform

windows 10

## appearance
![pict](https://github.com/zzz136454872/_vimrc/blob/master/appearance.jpg)

## functions 

Use Ctrl+u to compile and(or) run your code. 

1. autocompile
    now it can compile (or run) c, cpp, latex, java, go and even arduino. 

    of course, it needs the compiler. 
2. automake
    press <C-N> to run mingw32-make

    needs gcc tool chain. 

3. python debug
    press <C-D> to use ipdb to debug a python file. 

4. autocomplete
    with the help of ycm

5. go to defination
    this can be done through ctags or ycm. 
## plug-ins 
1. vim-plug 
    This needs to be installed manually. 
2. nerdtree
3. vim-latex
4. vim-markdown 
5. YouCompleteMe

these will be installed using`:PlugInstall`after vim-plug is installed.
Before this command, delete what you don't need and add what else you need. 

YouCompleteMe may need some extra configure and realy long time. 
If you don't need it, comment that line. 

## software dependencies

1. gcc
2. g++
2. mingw32-make
3. jdk
4. go
5. arduino
6. texlive
7. python3
8. ctags

Install what you need. 

## for linux 
a similar gvim configure file is at
[vimrc_for_ubuntu](https://github.com/zzz136454872/vimrc_for_ubuntu)

*if anything in need contract me at [zzz136454872@163.com](zzz136454872@163.com)*

