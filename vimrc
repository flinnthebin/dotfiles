" GLOBAL

" Turn off Vi backwards compatibility
set nocompatible
" Formatting
syntax on
set encoding=utf-8
set background=dark
set number
set relativenumber
set wrap
set numberwidth=2
set tabstop=2
set shiftwidth=2
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
set wildmenu

" Enables
" - tab can now :find by partial match
" - use * to make it fuzzy

" Considerations
" - :b - autocompletion on open buffer
"   providing the :b command with a unique substring of an open file
"   in the file buffer :ls will make vim jump to that file. If more
"   than one match, throws error. Allows for tabcomplete
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

" Considerations
" - ^n and ^p toggle autocomplete (NP Complete lmao)

" AUTO-CLOSING BRACKETS
inoremap } }<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
inoremap ] ]<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
inoremap ) )<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
inoremap > ><Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a

" KEY BINDINGS

let mapleader = ';'

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
" Display the path and filename in the current buffer
:set statusline=%f
" Separate left-aligned and right-aligned items in statusline
:set statusline+=%=
" Append current line number to statusline
:set statusline+=%l
" Add forwardslash
:set statusline+=/
" Append total number of lines
:set statusline+=%L

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1
" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1
" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

" WELCOME MESSAGE

:echom "SHIFT + K = keyword lookup"
:echom " "
:echom ":help ins-completion = AUTOCOMPLETE COMMANDS"
:echom " "
:echom "1. Whole lines                                 |i_CTRL-X_CTRL-L|"
:echom "2. keywords in the current file                |i_CTRL-X_CTRL-N|"
:echom "3. keywords in 'dictionary'                    |i_CTRL-X_CTRL-K|"
:echom "4. keywords in 'thesaurus', thesaurus-style    |i_CTRL-X_CTRL-T|"
:echom "5. keywords in the current and included files  |i_CTRL-X_CTRL-I|"
:echom "6. tags                                        |i_CTRL-X_CTRL-]|"
:echom "7. file names                                  |i_CTRL-X_CTRL-F|"
:echom "8. definitions or macros                       |i_CTRL-X_CTRL-D|"
:echom "9. Vim command-line                            |i_CTRL-X_CTRL-V|"
:echom "10. User defined completion                    |i_CTRL-X_CTRL-U|"
:echom "11. omni completion                            |i_CTRL-X_CTRL-O|"
:echom "12. Spelling suggestions                       |i_CTRL-X_s|"
:echom "13. keywords in 'complete'                     |i_CTRL-N| |i_CTRL-P|"
