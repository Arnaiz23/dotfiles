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
Plug 'neoclide/coc.nvim', {'branch' : 'release'} "Autocompletado
Plug 'dense-analysis/ale' " Prettier al guardar

" Buscador de files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Iconos
Plug 'ryanoasis/vim-devicons'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
Plug 'nvim-telescope/telescope-file-browser.nvim'

" Inferior line better
Plug 'nvim-lualine/lualine.nvim'

" Izquierda git colores
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

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
noremap <leader>m :Maps<cr>
noremap <leader>Q :wq<cr>
noremap <leader>t :tabnew<cr>:Telescope find_files<cr>
noremap <leader>e :e 
noremap <leader>g :% s/
noremap <leader>i gg=G<C-o><C-o>
map <F3> :Telescope file_browser<cr>
noremap <leader>p :Telescope find_files<cr>

" source coc
source ~/.dotfiles/nvim/coc.vim

" Delete errors
let g:coc_disable_startup_warning = 1

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
lua << END

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
      },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      }
    },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
    },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
    },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
  }
END

" bufferline
set termguicolors
lua << EOF
require('bufferline').setup {
  options = {
    mode = "tabs",
    numbers = "ordinal",
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    diagnostics = "coc",
    color_icons = true,
    show_close_icon = true,
    separator_style = "slant",
    hover = {
        enabled = true,
        delay = 200,
        reveal = {'close'}
    },
  },
  highlights = {
    separator = {
      fg = '#073642',
      bg = '#002b36',
    },
    separator_selected = {
      fg = '#073642',
    },
    background = {
      fg = '#657b83',
      bg = '#002b36'
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bold = true,
    },
    fill = {
      bg = '#073642'
    }
  },
}
EOF

