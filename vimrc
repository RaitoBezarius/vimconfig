" Pathogen modules
execute pathogen#infect()
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
" Paste shortcut
set pastetoggle=<F2>
colorscheme landscape
if has('unix')
	set t_Co=256
endif

" Cool trick to save when you forget to start vim using sudo
cmap w!! w !sudo tee > /dev/null %

" Expansion triggers for UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

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
