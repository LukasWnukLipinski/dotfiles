syntax on
set number
set nocompatible
set encoding=utf-8
filetype plugin indent on

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" define tab to prodice 4 white spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab


call plug#begin('~/.vim/plugged')
" ---> this is where you add your plugins <---

" Configuring NerdTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
   
  " ---> to hide unwanted files <---
  let NERDTreeIgnore = [ '__pycache__', '\.pyc$', '\.o$', '\.swp',  '*\.swp',  'node_modules/' ]
  " ---> show hidden files <---
  let NERDTreeShowHidden=1
  " ---> autostart nerd-tree when you start vim <---
  "autocmd vimenter * NERDTree
  "autocmd StdinReadPre * let s:std_in=1
  "autocmd VimEnter * if argc() == 0 && !exists("s:stdn_in") | NERDTree | endif
  " ---> toggling nerd-tree using Ctrl-N <---
  map <C-n> :NERDTreeToggle<CR>
  " close vim if the only window left open is a NERDTree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  " change Arrows
  let g:NERDTreeDirArrowExpandable = '▸'
  let g:NERDTreeDirArrowCollapsible = '▾'


" Configure lightline
Plug 'itchyny/lightline.vim'
  "  -- INSERT -- is unnecessary anymore because the mode information is displayed in the statusline. 
  set noshowmode


" Configure Jedi for Python Completion  
Plug 'davidhalter/jedi-vim'

" Configure FuzzyFinder 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'




" Configuring YouCompleteMe
Plug 'valloric/youcompleteme', { 'do': './install.py --all' }
  
  " ---> youcompleteme configuration <---
  let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
  
  " ---> compatibility with another plugin (ultisnips) <---
  let g:ycm_key_list_select_completion = [ '<C-n>', '<Down>' ] 
  let g:ycm_key_list_previous_completion = [ '<C-p>', '<Up>' ]
  let g:SuperTabDefaultCompletionType = '<C-n>'
  " ---> disable preview window <---
  set completeopt-=preview
  " ---> navigating to the definition of a a symbol <---
  map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>




" Git integration
" ---> git commands within vim <---
Plug 'tpope/vim-fugitive'
" ---> git changes on the gutter <---
Plug 'airblade/vim-gitgutter'
" ---> nerdtree git changes <---
Plug 'Xuyuanp/nerdtree-git-plugin'
"



" TMux - Vim integration
Plug 'christoomey/vim-tmux-navigator'





call plug#end()

