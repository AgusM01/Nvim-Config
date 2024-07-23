local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- Themes 
    use 'ellisonleao/gruvbox.nvim'
    use "rebelot/kanagawa.nvim"
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'AlexvZyl/nordic.nvim'
    use "folke/tokyonight.nvim"
    -- Tree configuration and lualine 
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-lualine/lualine.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    -- Lsp configuration 
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    -- Auto completion configuration 
    use ({
	      "L3MON4D3/LuaSnip",
	      -- follow latest release.
	      tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	      -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    })

    use "rafamadriz/friendly-snippets"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lsp"

    -- telescope configuration 
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        requires = { {'nvim-lua/plenary.nvim'} }
        }
    -- transparent
    use 'tribela/vim-transparent'

    -- git-things
    use "tpope/vim-fugitive"
    use "lewis6991/gitsigns.nvim"
    -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
