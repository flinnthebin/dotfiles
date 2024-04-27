let mapleader = ';'
let localleader = ';'
colorscheme retrobox 
:" Turn off Vi backwards compatibility
set nocompatible
" Formatting
" set textwidth = 120 (use for school)
syntax on
set encoding=utf-8
set number
set relativenumber
set wrap
set numberwidth=4
set tabstop=4
set shiftwidth=4
set expandtab
set showmatch
set matchtime=3
" define what a word is (navigation)
set iskeyword?

" Enable the VIM default plugin netrw
" supports FTP, HTTP, SCP. enables directory traversal and file interaction
" enable recursive directory traversal to create a fuzzy finder.
filetype plugin on

" FZF

" Set - command that changes a built-in configuration variable (path)
" += - append to the existing value of variable (default value for path
" variable)
" ** - recursive wildcard pattern. vim should not only search directories in
" the path, but all subdirectories to unlimited depth
set path+=**

" Display all matching files on tab-complete
" :find tabs through partial matches
" :b <substring> autocompletes from the file buffer
" :ls jumps to recently buffered file
set wildmenu
"
" TAG JUMPING
" install ctags
set tags+=./tags;

" Create the `tags` file
command! MakeTags !ctags -R .

" ^] - jump to tag under cursor
" " g^] - jump to ambiguous tag
" ^t - jump back up the tag stack
" ctags -R . - search recursively
" - ^n and ^p toggle autocomplete (NP Complete lmao)

" FILE BROWSING

" disable netrw banner
let g:netrw_banner=0
" open in prior window
let g:netrw_browse_split=4
"open splits to the right
let g:netrw_altv=1
" tree view
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.S\+'

" C++ SNIPPETS
" Control Flow 
nnoremap <leader>if.cpp :-1read $HOME/.config/nvim/templates/cpp/control-flow/if.cpp<CR>
nnoremap <leader>for.cpp :-1read $HOME/.config/nvim/templates/cpp/control-flow/for.cpp<CR>
nnoremap <leader>switch.cpp :-1read $HOME/.config/nvim/templates/cpp/control-flow/switch.cpp<CR>
" Data Structures
nnoremap <leader>array.cpp :-1read $HOME/.config/nvim/templates/cpp/data-structures/array.cpp<CR>
nnoremap <leader>deque.cpp :-1read $HOME/.config/nvim/templates/cpp/data-structures/deque.cpp<CR>
nnoremap <leader>list.cpp :-1read $HOME/.config/nvim/templates/cpp/data-structures/list.cpp<CR>
nnoremap <leader>map.cpp :-1read $HOME/.config/nvim/templates/cpp/data-structures/map.cpp<CR>
nnoremap <leader>priority.cpp :-1read $HOME/.config/nvim/templates/cpp/data-structures/priority.cpp<CR>
nnoremap <leader>queue.cpp :-1read $HOME/.config/nvim/templates/cpp/data-structures/queue.cpp<CR>
nnoremap <leader>set.cpp :-1read $HOME/.config/nvim/templates/cpp/data-structures/set.cpp<CR>
nnoremap <leader>stack.cpp :-1read $HOME/.config/nvim/templates/cpp/data-structures/stack.cpp<CR>
nnoremap <leader>umap.cpp :-1read $HOME/.config/nvim/templates/cpp/data-structures/umap.cpp<CR>
nnoremap <leader>uset.cpp :-1read $HOME/.config/nvim/templates/cpp/data-structures/uset.cpp<CR>
nnoremap <leader>vector.cpp :-1read $HOME/.config/nvim/templates/cpp/data-structures/vector.cpp<CR>
" Design Patterns
" Creational
nnoremap <leader>abfactory.cpp :-1read $HOME/.config/nvim/templates/cpp/design-patterns/abstractfactory.cpp<CR>
nnoremap <leader>builder.cpp :-1read $HOME/.config/nvim/templates/cpp/design-patterns/builder.cpp<CR>
nnoremap <leader>factory.cpp :-1read $HOME/.config/nvim/templates/cpp/design-patterns/factory.cpp<CR>
nnoremap <leader>prototype.cpp :-1read $HOME/.config/nvim/templates/cpp/design-patterns/prototype.cpp<CR>
nnoremap <leader>singleton.cpp :-1read $HOME/.config/nvim/templates/cpp/design-patterns/singleton.cpp<CR>
" Structural
nnoremap <leader>adapter.cpp :-1read $HOME/.config/nvim/templates/cpp/design-patterns/adapter.cpp<CR>
nnoremap <leader>bridge.cpp :-1read $HOME/.config/nvim/templates/cpp/design-patterns/bridge.cpp<CR>
nnoremap <leader>composite.cpp :-1read $HOME/.config/nvim/templates/cpp/design-patterns/composite.cpp<CR>
nnoremap <leader>decorator.cpp :-1read $HOME/.config/nvim/templates/cpp/design-patterns/decorator.cpp<CR>
nnoremap <leader>facade.cpp :-1read $HOME/.config/nvim/templates/cpp/design-patterns/facade.cpp<CR>
nnoremap <leader>flyweight.cpp :-1read $HOME/.config/nvim/templates/cpp/design-patterns/flyweight.cpp<CR>
nnoremap <leader>proxy.cpp :-1read $HOME/.config/nvim/templates/cpp/design-patterns/proxy.cpp<CR>
" Behavioural
nnoremap <leader>chain.cpp :-1read $HOME/.config/nvim/templates/cpp/design-patterns/chain.cpp<CR>
nnoremap <leader>command.cpp :-1read $HOME/.config/nvim/templates/cpp/design-patterns/command.cpp<CR>
nnoremap <leader>interpreter.cpp :-1read $HOME/.config/nvim/templates/cpp/design-patterns/interpreter.cpp<CR>
nnoremap <leader>iterator.cpp :-1read $HOME/.config/nvim/templates/cpp/design-patterns/iterator.cpp<CR>
nnoremap <leader>mediator.cpp :-1read $HOME/.config/nvim/templates/cpp/design-patterns/mediator.cpp<CR>
nnoremap <leader>memento.cpp :-1read $HOME/.config/nvim/templates/cpp/design-patterns/memento.cpp<CR>
nnoremap <leader>observer.cpp :-1read $HOME/.config/nvim/templates/cpp/design-patterns/observer.cpp<CR>
nnoremap <leader>state.cpp :-1read $HOME/.config/nvim/templates/cpp/design-patterns/state.cpp<CR>
nnoremap <leader>strategy.cpp :-1read $HOME/.config/nvim/templates/cpp/design-patterns/strategy.cpp<CR>
nnoremap <leader>template.cpp :-1read $HOME/.config/nvim/templates/cpp/design-patterns/template.cpp<CR>
nnoremap <leader>visitor.cpp :-1read $HOME/.config/nvim/templates/cpp/design-patterns/visitor.cpp<CR>

" Replace all occurences of word under cursor
nnoremap <leader>ra :%s/<c-r><c-w>/<c-r><c-w>/gc<c-f>$F/i

"Go Formatter
nnoremap <leader>G :GoFmt<CR>
"Little Linter
nnoremap<leader>L :%!lindt<CR>

" AUTO-CLOSING BRACKETS
"inoremap } }<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
"inoremap ] ]<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
"inoremap ) )<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
"inoremap > ><Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a

" KEY BINDINGS

" Enclose selected text in quotations/brackets
:nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
:nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
:nnoremap <leader>{ viw<esc>a}<esc>hbi{<esc>lel
:nnoremap <leader>[ viw<esc>a]<esc>hbi[<esc>lel
:nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
:nnoremap <leader>< viw<esc>a><esc>hbi<<esc>lel

" Logical Mappings for Start/End of Line/Document
:nnoremap 0 H
:nnoremap $ L
:nnoremap H 0
:nnoremap L $
:vnoremap 0 H
:vnoremap $ L
:vnoremap H 0
:vnoremap L $

" Exit normal mode (but quickly)
:inoremap jk <esc>
" Swap line with line below
:map - ddp

" MIMGA (Make Insert Mode Great Again)
" Move cursor backwards char-by-char in (insert mode)
:imap <c-x> <esc>xi
" Delete current line (insert mode)
:imap <c-d> <esc>ddi
" Undo all changes on the current line (insert mode)
:imap <c-u> <esc>Ui

" Arrow keys adjust indentation, paragraph navigation
:nmap <Left> <<
:nmap <Right> >>
:vmap <Left> <gv
:vmap <Right> >gv
:nmap <Up> {
:nmap <Down> }
:vmap <Up> {
:vmap <Down> }

" File Autogroups (<leader>c for commenting out lines)
" vim - defines code folding in vimscript files using
" text markers '{{{' and '}}}'
:augroup vim
:    autocmd!
:    autocmd FileType vim setlocal foldmethod=marker
:		 autocmd FileType vim nnoremap <buffer> <leader>c I"<esc>
:augroup end
" Group for languages using // comments
augroup lineCommentSlash
    autocmd!
    autocmd FileType c,cpp,java,go,javascript,typescript,rust nnoremap <buffer> <leader>c I//<esc>
augroup END
" Group for languages using # comments
augroup lineCommentHash
    autocmd!
    autocmd FileType python,bash,ruby,ocaml nnoremap <buffer> <leader>c I#<esc>
augroup END

" Statusline
:set statusline=%f%=%c,%{strlen(getline('.'))}\|%l/%L

" WELCOME MESSAGE

:echom "SHIFT + K = keyword lookup"
:echom " "
:echom ":help ins-completion = AUTOCOMPLETE COMMANDS"
:echom " "
:echom ":help netrw-browse-maps = FILE BROWSING MAPPINGS" 
:echom " "
:echom ":help c_<command> i_<command>, v_<command> for non-normal mode command help"
:echom " "
:echom ":helpgrep <term> to grep all help files. nav :cn, :ca, :cl"

command GPT call GPT()

function! GPT()
    let path = expand('/usr/bin/iago')
    let tokens = 4096
    let temperature = 0
    let curr = expand('%p')
    let type = fnamemodify(curr, ':e')
    let out = 'out.' . type
    let cmd = '! ' . shellescape(path) . ' -s ' . tokens . ' -t ' . temperature . ' ' . shellescape(curr)
    execute cmd
    execute 'vsplit ' . out
endfunction
