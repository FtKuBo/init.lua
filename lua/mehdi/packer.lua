-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use({
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            vim.cmd("colorscheme rose-pine")
        end
    })
    use({ 'nvim-treesitter/nvim-treesitter' }, { run = ':TSUpdate' })
    use({ 'nvim-treesitter/playground' })
    use({ 'theprimeagen/harpoon' })
    use({ 'mbbill/undotree' })
    use({ 'tpope/vim-fugitive' })
    use({ 'github/copilot.vim' })
    use({
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    })
    use({
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            require 'lspconfig'.lua_ls.setup({})
            require 'lspconfig'.pyright.setup({})
            require 'lspconfig'.cssls.setup({})
            require 'lspconfig'.dockerls.setup({})
            require 'lspconfig'.docker_compose_language_service.setup({})
            require 'lspconfig'.clangd.setup({})
            require 'lspconfig'.vuels.setup({})
            require 'lspconfig'.ast_grep.setup({})
            require 'lspconfig'.djlsp.setup({})
            require('lspconfig').jdtls.setup({
                cmd = { 'jdtls' },  -- make sure jdtls is installed and on PATH
                root_dir = require('lspconfig').util.root_pattern('.git', 'pom.xml', 'build.gradle'),
            })
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            require("lspconfig").lua_ls.setup { capabilites = capabilities }
        end
    })
    use({
        "williamboman/mason-lspconfig.nvim",
        requires = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("mason-lspconfig").setup({
              ensure_installed = { "bashls", "html", "ts_ls" },
            })
        end,
    })
    use ({
        'saghen/blink.cmp',
        requires = { 'rafamadriz/friendly-snippets' },
        config = function()
            require('blink.cmp').setup({
                keymap = { preset = 'default' },
                appearance = {
                    use_nvim_cmp_as_default = true,
                    nerd_font_variant = 'mono',
                },
                signature = {
                    enabled = true
                },
                fuzzy = {
                    implementation = "lua"
                }
            })
        end
    })
    use({
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
    })
end)
