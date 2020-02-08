" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"encoding options"
set enc=utf-8
"colour scheme
colo desert
syntax on
"make space more useful
nnoremap <space> za
"ASCII art test cat
:echom "(>^.^<)"
"line spacings, text wrapping, indentation and parenthesis matching
set number
set numberwidth=2
set wrap
set shiftwidth=4
set showmatch
set matchtime=3
"some fancier parenthesis matchning code
inoremap } }<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
inoremap ] ]<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
inoremap ) )<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
"key mappings
:let mapleader = ","
:map <Leader>h :echo "Hello world"<CR>
:nnoremap <leader>ev :vsplit /usr/share/vim/vimrc<CR>
:nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel :nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
:nnoremap <leader>{ viw<esc>a}<esc>hbi{<esc>lel
:nnoremap <leader>[ viw<esc>a]<esc>hbi[<esc>lel
:nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
:nnoremap 0 H
:nnoremap $ L
:nnoremap H 0
:nnoremap L $
:inoremap jk <Esc>
:map - ddp
:imap <c-x> <esc>xi
:imap <c-d> <esc>ddi
:imap <c-u> <esc>Ui
:nmap <c-u> U
:nmap <Left> <<
:nmap <Right> >>
:nmap <Up> [e
:nmap <Down> ]e
:vmap <Left> <gv
:vmap <Right> >gv
:vmap <Up> [egv
:vmap <Down> ]egv
"abbreviations 
:set iskeyword?
:iabbrev adn and
:iabbrev waht what
:iabbrev tehn then
:iabbrev esle else
"autocommands
:augroup vim
:	autocmd!
:	autocmd FileType vim setlocal foldmethod=marker
:augroup end
:augroup javascript
:	autocmd FileType javascript nnoremap <buffer> <leader>c I//<esc>
:augroup end
:augroup python
:	autocmd FileType python nnoremap <buffer> <leader>c I#<esc>
:augroup end
"statusline
:set statusline=%f
:set statusline+=%=
:set statusline+=%l
:set statusline+=/
:set statusline+=%L




