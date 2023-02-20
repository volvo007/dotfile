local packer = require("packer")
packer.startup({
  function(use)
   -- Packer 可以管理自己本身
   use 'wbthomason/packer.nvim'
   -- 你的插件列表...

   ----colcorschemes----
   -- tokyonight
    use("folke/tokyonight.nvim")
    -- gruvbox
    use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
    -- nord
    use("shaunsingh/nord.nvim")
    -- nightfox
    use("EdenEast/nightfox.nvim")
    ----colorschemes----

    ----plugins----
    -- nvim-tree (新增)
    use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
    -- bufferline
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
    -- lualine
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")
    -- telescope
    use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
    -- treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    -- coc
    use({ 'neoclide/coc.nvim', branch = 'release' })
    -- toggleterm
    use({ 'akinsho/toggleterm.nvim' })

end,

  config = {
      display = {
          open_fn = function()
              return require("packer.util").float({ border = "single" })
          end,
      },
  },
})
-- 每次保存 plugins.lua 自动安装插件
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
