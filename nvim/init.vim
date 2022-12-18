source ~/.vimrc

" Directorio de plugins
call plug#begin('~/.local/share/nvim/plugged')

" Aquí irán los plugins a instalar
Plug 'tpope/vim-surround'  " Es buena idea agregar una descripción del plugin
Plug 'joshdick/onedark.vim' " theme One dark pro
Plug 'scrooloose/nerdtree' " Arbol de ficheros
Plug 'sheerun/vim-polyglot' " Resaltado de sintaxis
Plug 'jiangmiao/auto-pairs' " Autocompletado parentesis etc
Plug 'alvan/vim-closetag' " Cierre automatico de etiquetas
" Plug 'neoclide/coc.nvim', {'branch' : 'release'} "Autocompletado
Plug 'dense-analysis/ale' " Prettier al guardar

" Buscador de files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Iconos
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
Plug 'nvim-telescope/telescope-file-browser.nvim'

" Inferior line better
Plug 'nvim-lualine/lualine.nvim'

" Izquierda git colores
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

" Sincronizacion de git para que salga lo de la izquierda
Plug 'lewis6991/gitsigns.nvim'
" Colores en el #fff
Plug 'norcalli/nvim-colorizer.lua'
" Colores para tailwindcss
Plug 'princejoogie/tailwind-highlight.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'onsails/lspkind.nvim'

" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" For snippy users.
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'windwp/nvim-ts-autotag'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'jose-elias-alvarez/null-ls.nvim'

" Lsp UI
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }

" Indent plugin configuration
Plug 'lukas-reineke/indent-blankline.nvim'

call plug#end()

" Luego de esta línea puedes agregar tus configuraciones y mappings
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
      \   'javascriptreact' : ['prettier'],
      \   'typescriptreact' : ['prettier'],
      \   'typescript' : ['prettier'],
      \}

let g:ale_linters_explicit = 1

let g:ale_fix_on_save = 1

let g:ale_javascript_eslint_executable="eslint_d"
let g:ale_javascript_eslint_use_global=1

" Personal shortcuts
let mapleader = ","
noremap <leader>w :w<cr>
noremap <leader>F :Files<cr>
noremap <leader>m :Maps<cr>
noremap <leader>Q :wq<cr>
noremap <leader>t :tabnew<cr>:Telescope find_files hidden=true<cr>
noremap <leader>e :e 
noremap <leader>g :% s/
noremap <leader>i gg=G<C-o><C-o>
map <F3> :Telescope file_browser<cr>
noremap <leader>p :Telescope find_files hidden=true<cr>
noremap <leader>n :MarkdownPreview<cr>

" source coc
" source ~/.dotfiles/nvim/coc.vim

" Delete errors
" let g:coc_disable_startup_warning = 1

lua << EOF
local fb_actions = require "telescope".extensions.file_browser.actions
require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
          },
        ["n"] = {
          ["<C-a>"] = fb_actions.create
          },
        },
      },
    },
  }
require("telescope").load_extension "file_browser"
EOF

" Inferior line lualine
"
source ~/.dotfiles/nvim/plugins/lualine.lua

" bufferline
"
set termguicolors
source ~/.dotfiles/nvim/plugins/bufferline.lua

" LSP Configuration
"
source ~/.dotfiles/nvim/plugins/lspconfig.lua
source ~/.dotfiles/nvim/plugins/cmp.lua
source ~/.dotfiles/nvim/plugins/lspkind.lua
source ~/.dotfiles/nvim/plugins/lsp-colors.lua
source ~/.dotfiles/nvim/plugins/web-devicons.lua
source ~/.dotfiles/nvim/plugins/gitsigns.lua
source ~/.dotfiles/nvim/plugins/treesitter.lua
source ~/.dotfiles/nvim/plugins/null-ls.lua
source ~/.dotfiles/nvim/plugins/lspsaga.lua

lua << EOF
require'colorizer'.setup()
require('nvim-ts-autotag').setup()
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { "quick_lint_js", "tailwindcss" , "cssls", "jsonls", "eslint" },
  automatic_installation = true
})
EOF

" Indent configuration
"
lua << EOF
require("indent_blankline").setup {
    char = "┊",
    show_trailing_blankline_indent = false,
}
EOF
