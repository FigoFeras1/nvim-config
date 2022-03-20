let g:python_host_prog  = 'C:\Users\Feras\AppData\Local\Programs\Python\Python310\python.EXE'
let g:python3_host_prog = 'C:\Users\Feras\AppData\Local\Programs\Python\Python310\python.EXE'
" >> load plugins
call plug#begin('C:/Users/Feras/AppData/Local/nvim/plugged')
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'voldikss/vim-floaterm'

    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'rafamadriz/friendly-snippets'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

    Plug 'liuchengxu/space-vim-theme'
    Plug 'colepeters/spacemacs-theme.vim'
    Plug 'dikiaap/minimalist'
    "Plug 'lifepillar/vim-gruvbox8'
    "Plug 'nikvdp/neomux'
    "Plug 'andweeb/presence.nvim'
    Plug 'romgrk/doom-one.vim'
    Plug 'justinmk/vim-sneak'
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'

    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'

    Plug 'jiangmiao/auto-pairs'
    Plug 'machakann/vim-sandwich'
    Plug 'luochen1990/rainbow'
    Plug 'numToStr/comment.nvim'

    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tweekmonster/startuptime.vim'
    Plug 'goolord/alpha-nvim'
    "Plug 'mhinz/vim-startify'

    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'mfussenegger/nvim-dap'

    Plug 'lewis6991/impatient.nvim'
call plug#end()

" Works!!!
function! SuperTab()
  let l:char = strpart(getline('.'),col('.')-1,1)
  if (l:char =~ '^\W\S\?$')
	  "echo "right"
	  return "\<Right>"
  else
	  "echo "tab"
	  return "\<Tab>"
  endif
endfunction

inoremap <silent> <Tab> <C-R>=SuperTab()<CR>

let mapleader = ' '

filetype plugin on

set pumheight=7
set pumwidth=10

map s <Plug>Sneak_s
map S <Plug>Sneak_S
:nmap <M-Right> :vertical resize +1<CR>
:nmap <M-Left> :vertical resize -1<CR>
:nmap <M-Down> :resize +1<CR>
:nmap <M-Up> :resize -1<CR>

nnoremap gh <C-W><C-H>
nnoremap gj <C-W><C-J>
nnoremap gk <C-W><C-K>
nnoremap gl <C-W><C-L>

nnoremap <Leader>h <C-W>H
nnoremap <Leader>j <C-W>J
nnoremap <Leader>k <C-W>K
nnoremap <Leader>l <C-W>L

:nnoremap <Leader>w :w<CR>:source<CR>:nohlsearch<CR>
:nnoremap <C-S> :w<CR>

:nnoremap <Leader><Esc> :nohlsearch<CR><CR>
:nnoremap <Leader>rc :tabe $MYVIMRC<CR>

:nnoremap <Leader>ft :FloatermNew<CR>
:nnoremap <Leader>td :FloatermToggle<CR>



map // <Leader>c<Leader><Down>

nnoremap <Leader>t <C-\><C-n>

"autocmd filetype c nnoremap <F5> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && '.shellescape('%:r')<CR>
autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType * set formatoptions-=o
autocmd FileType c      :tnoremap <F5> :FloatermNew --autoclose=0 gcc % -o %< && %<<CR>
autocmd FileType c      :nnoremap <F5> :FloatermNew --autoclose=0 gcc % -o %< && %<<CR>
autocmd FileType cpp    :tnoremap <F5> :FloatermNew --autoclose=0 g++ % -o %< && %<<CR>
autocmd FileType cpp    :nnoremap <F5> :FloatermNew --autoclose=0 g++ % -o %< && %<<CR>
autocmd FileType prolog :tnoremap <F5> :FloatermNew --autoclose=0 gplc % && %<<CR>
autocmd FileType prolog :nnoremap <F5> :FloatermNew --autoclose=0 gplc % && %<<CR>
autocmd FileType python :tnoremap <F5> :FloatermNew --autoclose=0 python %<CR>
autocmd FileType python :nnoremap <F5> :FloatermNew --autoclose=0 python %<CR>
autocmd FileType scheme :tnoremap <F5> :FloatermNew --autoclose=0 racket -if %<CR>
autocmd FileType scheme :nnoremap <F5> :FloatermNew --autoclose=0 racket -if %<CR>
autocmd FileType rust   :tnoremap <F5> :FloatermNew --autoclose=0 rustc % && %<<CR>
autocmd FileType rust   :nnoremap <F5> :FloatermNew --autoclose=0 rustc % && %<<CR>
:tnoremap <F1> <C-\><C-n>:FloatermKill<CR>


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').file_browser()<cr>

let g:floaterm_width=0.8
let g:floaterm_height=0.8


colorscheme spacemacs-theme
let g:doom_one_terminal_colors = v:true

" basic settings
set t_Co=256
set termguicolors
set cursorline
syntax on
set number
set ignorecase    " ignore case
set smartcase     " but don't ignore it, when search string contains uppercase letters
set visualbell
set expandtab
set tabstop=4
set ruler
set smartindent
set shiftwidth=4
set hlsearch
set virtualedit=onemore
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent
set encoding=utf-8
set relativenumber
set completeopt=menu,menuone,noselect
set whichwrap=<,>,h,l
set incsearch
set noshowmode
set linebreak
set nowrap
set updatetime=2000
set formatoptions-=o
set autowrite
" set guicursor=i:block

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

"let g:neovide_fullscreen=1
"let g:neovide_cursor_animation_length = 0

let g:airline_theme = 'bubblegum'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let ttimeoutlen = 10
let g:airline_section_c_only_filename = 1
let g:airline_detect_spell=1
let g:airline_skip_empty_section=1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.colnr = ''

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.dirty='⚡'

let g:airline_section_warning = ''
"let g:airline_section_error = ''

let g:indent_blankline_filetype_exclude = ['alpha', 'text', 'help', 'terminal']
let g:indent_blankline_show_current_context = v:true
let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_strict_tabs = v:true

let g:sneak#label = 1

" immediately move to the next instance of search, if you move the cursor sneak is back to default behavior
let g:sneak#s_next = 1

" Change the colors
highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan
highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow

" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:rainbow_active = 1

let g:signify_sign_add = '+'
let g:signify_sign_delete = '_'
let g:signify_sign_delete_first_line = '-'
let g:signify_sign_change = '~'

let g:signify_sign_show_count = 1
let g:signify_sign_show_text = 1

let g:nvim_tree_follow = 1
let g:nvim_tree_side = 'right'
let g:nvim_tree_gitignore = 1 "0 by default
let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 0 "1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_refresh_wait = 500 "1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.
let g:nvim_tree_window_picker_exclude = { 'filetype': ['notify', 'packer', 'qf'],'buftype': ['terminal'] }
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = { 'git': 1, 'folders': 1, 'files': 1, 'folder_arrows': 1 }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = { 'default': '', 'symlink': '', 'git': { 'unstaged': "✗", 'staged': "✓", 'unmerged': "", 'renamed': "➜", 'untracked': "★", 'deleted': "", 'ignored': "◌", },  'folder': { 'arrow_open': "", 'arrow_closed': "", 'default': "", 'open': "", 'empty': "", 'empty_open': "", 'symlink': "", 'symlink_open': "", } }

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them


" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

lua << EOF
  -- Setup nvim-cmp.
  require'impatient'.enable_profile()
 local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        select = true,
      }),
    -- ["<Tab>"] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --    local entry = cmp.get_selected_entry()
	-- if not entry then
	--   cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
	-- end
	-- cmp.confirm()
    --   else
    --     fallback()
    --   end
    -- end, {"i","s","c",}),
    },

experimental = {
    native_menu = false,
    ghost_text = true
    },

    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })


  local servers = {'clangd', 'jdtls'}
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  for _,lsp in ipairs(servers) do
      require('lspconfig')[lsp].setup {
          update_in_insert = true,
          capabilities = capabilities
    }
end

    -- Color table for highlights
    -- stylua: ignore
    local colors = {
      bg       = '#202328',
      fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand '%:t') ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand '%:p:h'
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}


vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
vim.opt.list = true

require("indent_blankline").setup {
    char = "|",
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
    char_highlight_list = {
        'IndentBlanklineIndent1',
        'IndentBlanklineIndent2',
        'IndentBlanklineIndent3',
        'IndentBlanklineIndent4',
        'IndentBlanklineIndent5',
        'IndentBlanklineIndent6',
    },
}



require('nvim-tree').setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = true,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = true,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  view = {
    width = 60,
    height = 60,
    hide_root_folder = false,
    side = 'right',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    }
  }
}

 require('nvim-web-devicons').setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

local lsp_installer = require("nvim-lsp-installer")

-- Provide settings first!
lsp_installer.settings {
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
}

lsp_installer.on_server_ready(function (server) server:setup {} end)

require('telescope').setup{
  defaults = {
      initial_mode = "normal",
   mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    },
    file_ignore_patterns = {".*%.exe"}
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
    local dashboard = require("alpha.themes.dashboard")
    math.randomseed(os.time())

    local function pick_color()
      local colors = {"String", "Identifier", "Keyword", "Number"}
      return colors[math.random(#colors)]
    end

    local function footer()
      local datetime = os.date("%m-%d-%Y  %H:%M:%S")
      return datetime
    end

    dashboard.section.header.val = {
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[        _                   __                _                ]],
    [[       /_\   __ _  ___   /\ \ \___  ___/\   /(_)_ __ ___       ]],
    [[      //_\\ / _` |/ _ \ /  \/ / _ \/ _ \ \ / / | '_ ` _ \      ]],
    [[     /  _  \ (_| | (_) / /\  /  __/ (_) \ V /| | | | | | |     ]],
    [[     \_/ \_/\__, |\___/\_\ \/ \___|\___/ \_/ |_|_| |_| |_|     ]],
    [[            |___/                                              ]]
   }
    dashboard.section.header.opts.hl = pick_color()


dashboard.section.buttons.val = {
  dashboard.button( "e", "   New file" , ":ene | startinsert <CR>"),
  dashboard.button( "f", "   Find file", ":Telescope find_files <CR>"),
 -- dashboard.button( "r", "   Recent",    ":Telescope oldfiles<CR>"),
  dashboard.button("r", "   Recently opened files", ":Telescope oldfiles<CR>"),
  dashboard.button( "s", "   Settings" , ":tabe $MYVIMRC<CR>"),
  -- dashboard.button( "p", "   Projects" , ":Telescope projects<CR>"),
  dashboard.button( "q", "   Quit",      ":qa<CR>"),
}
    --  button("SPC f h", "  Recently opened files"),
    --  button("SPC f f", "  Find file"),
    --  button("SPC f a", "  Find word"),
    --  button("SPC s l", "  Open session"),
    --  button("SPC c n", "  New file"),
    --  button("SPC c c", "  Update plugins"),
    --  button("q", "  Quit", "<Cmd>qa<CR>")

    dashboard.section.footer.val = footer()
    dashboard.section.footer.opts.hl = "Constant"

    --require("alpha").setup(dashboard.opts)
    require'alpha'.setup(require'alpha.themes.dashboard'.opts)

    require('Comment').setup()

EOF

"let g:startify_padding_left = 50

"let g:startify_custom_header = startify#center([
        "\ "         ___              _   _            _   _ _                     ",
        "\ "        / _ \\            | \\ | |          | | | (_)                  ",
        "\ "       / /_\\ \\ __ _  ___ |  \\| | ___  ___ | | | |_ _ __ ___         ",
        "\ "       |  _  |/ _` |/ _ \\| . ` |/ _ \\/ _ \\| | | | | '_ ` _ \\       ",
        "\ "       | | | | (_| | (_) | |\\  |  __/ (_) \\ \\_/ / | | | | | |       ",
        "\ "       \\_| |_/\\__, |\\___/\\_| \\_/\\___|\\___/ \\___/|_|_| |_| |_|  ",
        "\ "               __/ |                                                   ",
        "\ "              |___/                                                    ",
        "\ "                                                                       ",
        "\ "                      <0% ugly, 100% Agonizing!>                       ",
        "\ ])
