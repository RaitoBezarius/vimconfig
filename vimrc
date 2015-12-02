" Pathogen modules
filetype off
execute pathogen#infect()
execute pathogen#helptags()
" Syntax highlighting
syntax on
filetype plugin indent on
" Line numbers
set number
" Highlight search results
set hlsearch
" Match search result as I am typing
set incsearch
" Match case-sensitive or not based on the content.
set smartcase
" Ignore swap files, Python pre-compiled and gcc's object files.
set wildignore=*.swp,*.pyc,*.o
" Display airline bar
set laststatus=2
" Change terminal title
set title
" Lazy redrawing when executing macros
set lazyredraw
" Visual autocomplete
set wildmenu
" Highlight matching
set showmatch
" Enable folding
set foldenable
" Open all default fold at level <= 10
set foldlevelstart=10
" Nested folding level max = 10
set foldnestmax=10
" Folding by indentation
set foldmethod=indent
" Prevent Webpack from missing the write event
set backupcopy=yes
" Paste shortcut
set pastetoggle=<F2>
colorscheme jellybeans
if has('unix')
	set t_Co=256
endif

" Cool trick to save when you forget to start vim using sudo
cmap w!! w !sudo tee > /dev/null %

" Expansion triggers for UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Used libraries
let g:used_javascript_libs = 'underscore,react,flux'

" Python Mode configuration
let g:pymode_folding = 0
let g:pymode_doc = 0
let g:pymode_virtualenv = 1
let g:pymode_run = 0
let g:pymode_lint = 0
let g:pymode_rope = 0

" Jedi vim
let g:jedi#popup_on_dot = 0

" Let's ignore stupid things
" let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
" Now, .agignore is the ignorer file.
" Let's make CtrlP awesome
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" Auto quit the Insert mode when moving further than 3 lines.
autocmd InsertEnter * let s:insertLineStart = line(".")

function! <SID>InsertModeDown()
    if line(".") > s:insertLineStart + 1
        stopinsert
    endif
    return "\<Down>"
endfunction

function! <SID>InsertModeUp()
    if line(".") < s:insertLineStart - 1
        stopinsert
    endif
    return "\<Up>"
endfunction

inoremap <expr> <Down> <SID>InsertModeDown()
inoremap <expr> <Up>   <SID>InsertModeUp()

" Clear search highlighting
nmap <silent> ,/ :nohlsearch<CR>
" Open / close folds
nnoremap <space> za
" highlight last inserted text
nnoremap gV `[v`]
" Escape duplicate because Esc is too far from me
inoremap jk <esc>

" Kick from Insert mode when completing
au TabEnter * stopinsert

" LaTeX specific
autocmd FileType tex let b:vimtex_main = 'main.tex'
autocmd FileType tex let g:vimtex_enabled = 1
autocmd FileType tex let g:vimtex_imaps_leader = ','
autocmd FileType tex let g:vimtex_view_method = 'mupdf'
autocmd FileType tex nmap <silent> ,v :VimtexView<CR>
