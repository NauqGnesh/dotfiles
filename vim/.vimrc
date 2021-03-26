" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8

set nocompatible              " required
filetype off                  " required
set encoding=utf-8
set relativenumber
set nu
set ignorecase
set smarttab
" indents
filetype indent on
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'morhetz/gruvbox' 
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'preservim/nerdcommenter'
Plugin 'neoclide/coc.nvim'
Plugin 'alvan/vim-closetag'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'shougo/defx.nvim'
Plugin 'itchyny/lightline.vim'
Plugin 'xuhdev/vim-latex-live-preview'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"Notes
autocmd BufWritePost *note-*.md silent !~/bin/buildNote %:p

"colorscheme
" Important!!
if has('termguicolors')
    set termguicolors
endif

colo gruvbox
set background=dark
set guifont=FiraCode-Retina\ 18
syntax on

"Indent Guide
let g:indent_guides_start_level=2
let g:indent_guides_enable_on_vim_startup = 1


"clipboard copy paste
set clipboard+=unnamedplus

autocmd BufNewFile *.html 0r ~/.vim/templates/html.skel
autocmd BufNewFile *.css 0r ~/.vim/templates/css.skel

"disable highlighting
" if &diff
		" highlight! link DiffText MatchParen
" endif
set nohlsearch

"change escape to jk
inoremap jk <Esc>

" Git Gutter 
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterAdd guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red

"Plugin configs
"-------------------------------------------------------------------------------
"close tags
"-------------------------------------------------------------------------------

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.tsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,javascript,jsx'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

"----------------------------------------------------------------------------
"NerdCommenter
"----------------------------------------------------------------------------
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

"----------------------------------------------------------------------------
"Prettier
"----------------------------------------------------------------------------
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <leader>f  :CocCommand prettier.formatFile<CR>

"----------------------------------------------------------------------------
"COC completion
"----------------------------------------------------------------------------
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

"confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

autocmd CursorHold * silent call CocActionAsync('highlight')

" jump defintion
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"-------------------------------------------------------------------------------
" Latex Preview
"-------------------------------------------------------------------------------
let g:livepreview_previewer = 'zathura'
let g:livepreview_engine = 'xelatex'

"-------------------------------------------------------------------------------
" imports
"-------------------------------------------------------------------------------
"remap leader
let mapleader = " "
source ~/.vim/.vimrc.mappings
source 	~/.vim/bundle/lightline.vim/.vimrc.lightline
source 	~/.vim/bundle/defx.nvim/defx.rc.vim

