require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'lewis6991/impatient.nvim',
        config = function()
            require('impatient').enable_profile()
        end
    }

    use {
        'neovim/nvim-lspconfig',
        config = function()
            require("lsp_config")
        end
    }

    use {
        'williamboman/nvim-lsp-installer',
        config = function()
            local util = require("util")
            local lsp_installer = require("nvim-lsp-installer")

            lsp_installer.on_server_ready(function(server)
                local opts = {
                    on_attach = util.on_attach,
                    capabilities = util.capabilities,
                    update_in_insert = true,
                }

                if server.name == "sumneko_lua" then
                    opts.settings = {
                        Lua = {
                            diagnostics = {
                                globals = {'vim'},
                            },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                            },
                        },
                    }
                end

                server:setup(opts)
                vim.cmd [[ do User LspAttachBuffers ]]
            end)

            lsp_installer.settings {
                ui = {
                    icons = {
                        server_installed = "✓",
                        server_pending = "➜",
                        server_uninstalled = "✗"
                    }
                }
            }

        end
        }

    use {
        'hrsh7th/nvim-cmp',
        config = function()
            require("cmp_config")
        end
    }

    use('hrsh7th/cmp-nvim-lsp')                               -- LSP completion source
    use('hrsh7th/cmp-cmdline')                                -- Command line completion source
    use('hrsh7th/cmp-buffer')                                 -- Buffer completion source
    use('hrsh7th/cmp-path')                                   -- File path completion source
    use('hrsh7th/cmp-nvim-lua')                               -- Nvim Lua API completion
  --use('hrsh7th/cmp-calc')                                   -- In-buffer calculations ( 2+2 = 4 )
  --use('Saecki/crates.nvim')                                 -- Cargo.toml completion source
    use('saadparwaiz1/cmp_luasnip')                           -- Luasnip completion source

    use {
        'L3MON4D3/LuaSnip',
        config = function()
            require("luasnip_config")
        end
    }

    use('nvim-treesitter/nvim-treesitter')

    use("onsails/lspkind-nvim")

    use {
        'windwp/nvim-autopairs',
        config = function ()
            require('nvim-autopairs').setup {
                enable_check_bracket_line= true,
                map_c_h = true,
                map_c_w = true
            }
        end
    }

    use {
       'numToStr/comment.nvim',
       config = function()
           require('Comment').setup()
       end
    }

    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end
    }

    -- TODO: Customize colors and context
    use {
        'lukas-reineke/indent-blankline.nvim',
        require('indent_blankline').setup {
            indent_blankline_char = '│',
            show_current_context = true,
            show_current_context_start = true,
        }

    }

    use ('justinmk/vim-sneak')
    use ('unblevable/quick-scope')

    -- TODO: Figure out what this does
    use ('nvim-lua/plenary.nvim')

    -- TODO: Look more into how this works and telescope integration
    use {
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require("todo-comments").setup {

            }
        end
    }

    use {
        'nvim-telescope/telescope.nvim' ,
        config = function()
            require("telescope").setup {
                defaults = {
                    initial_mode="normal"
                }
            }
        end
    }


    -- TODO: Sort out highlighting or just replace this with phaazon/hop.nvim
    use {
        'rlane/pounce.nvim',
        config = function()
            require('pounce').setup {}
        end
    }

    use ('antoinemadec/FixCursorHold.nvim')

    -- TODO: Look more into customization
    use {
        'folke/which-key.nvim',
        config = function()
            require('which-key').setup {

            }
        end
    }

    use {
        "simrat39/rust-tools.nvim",
        config = function()
            require("rust_tools_config")
        end,
    }

    use ("tpope/vim-surround")
    use ("tpope/vim-repeat")

-- use {
--   'abecodes/tabout.nvim',
--   config = function()
--     require('tabout').setup {
--     tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
--     backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
--     act_as_tab = true, -- shift content if tab out is not possible
--     act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
--     enable_backwards = true, -- well ...
--     completion = true, -- if the tabkey is used in a completion pum
--     tabouts = {
--       {open = "'", close = "'"},
--       {open = '"', close = '"'},
--       {open = '`', close = '`'},
--       {open = '(', close = ')'},
--       {open = '[', close = ']'},
--       {open = '{', close = '}'}
--     },
--     ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
--     exclude = {} -- tabout will ignore these filetypes
-- }
--   end,
--     wants = {'nvim-treesitter'}, -- or require if not used so far
--     after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
-- }
--
-- use({
--     "mhartington/formatter.nvim",
--     config = function()
--         require('formatter').setup({
--             filetype = {
--                 c  = {
--                     function()
--                         return {
--                             exe = "clang-format",
--                             args = {"-i", "-style=\"{BaseOnStyle: google, IndentWidth: 4}\"", vim.api.nvim_buf_get_name(0)},
--                             stdin = false,
--                         }
--                     end,
--                 }
--             }
--         })
--     end
-- })

    -- TODO:  Look more into customization
   use({
    'NTBBloodbath/doom-one.nvim',
    config = function()
        require('doom-one').setup({
            cursor_coloring = false,
            terminal_colors = false,
            italic_comments = true,
            enable_treesitter = true,
            transparent_background = false,
            pumblend = {
                enable = false,
                transparency_amount = 20,
            },
            plugins_integrations = {
                neorg = true,
                barbar = true,
                bufferline = true,
                gitgutter = true,
                gitsigns = true,
                telescope = true,
                neogit = true,
                nvim_tree = true,
                dashboard = true,
                startify = true,
                whichkey = true,
                indent_blankline = true,
                vim_illuminate = true,
                lspsaga = true,
            },
        })
    end,
})

    use ('tweekmonster/startuptime.vim')

end)
