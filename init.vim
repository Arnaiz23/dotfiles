source ~/.vimrc

" Directorio de plugins
call plug#begin('~/.local/share/nvim/plugged')

" Aquí irán los plugins a instalar
Plug 'tpope/vim-surround'  " Es buena idea agregar una descripción del plugin
Plug 'joshdick/onedark.vim' " theme One dark pro
Plug 'scrooloose/nerdtree' " Arbol de ficheros
Plug 'maximbaz/lightline-ale' " Linea inferior
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot' " Resaltado de sintaxis
Plug 'jiangmiao/auto-pairs' " Autocompletado parentesis etc
Plug 'alvan/vim-closetag' " Cierre automatico de etiquetas
Plug 'neoclide/coc.nvim', {'branch' : 'release'} "Autocompletado
Plug 'dense-analysis/ale' " Prettier al guardar

" Buscador de files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Iconos
Plug 'ryanoasis/vim-devicons'

call plug#end()

" Luego de esta línea puedes agregar tus configuraciones y mappings
"
set termguicolors  " Activa true colors en la terminal
colorscheme onedark  " Activa tema onedark


let g:NERDTreeChDirMode = 2  " Cambia el directorio actual al nodo padre actual
let g:NERDTreeQuitOnOpen=1 " Cierra el tree al seleccionar una opcion
" Abrir/cerrar NERDTree con F2
map <F2> :NERDTreeToggle<CR>

let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo

" Cargar fuente Powerline y símbolos (ver nota)
let g:airline_powerline_fonts = 1

set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)

" Activar deoplete al iniciar Neovim
let g:deoplete#enable_at_startup = 1

" Cerrar automaticamente la ventana de vista previa (donde se muestra documentación, si existe)
augroup deopleteCompleteDoneAu
  autocmd!
  autocmd CompleteDone * silent! pclose!
augroup END


" ALE configuration

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}

let g:ale_linters_explicit = 1

let g:ale_fix_on_save = 1

" Personal shortcuts
let mapleader = ","
noremap <leader>w :w<cr>
noremap <leader>F :Files<cr>
noremap <leader>q :q<cr>
noremap <leader>m :Maps<cr>
noremap <leader>Q :wq<cr>

" source coc
source ~/.dotfiles/coc.vim

" Delete errors
 let g:coc_disable_startup_warning = 1
