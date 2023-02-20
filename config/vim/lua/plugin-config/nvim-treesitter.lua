local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  vim.notify("没有找到 nvim-treesitter")
  return
end

treesitter.setup({
  -- 安装 language parser
  -- 启用代码高亮模块
highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  -- 启用增量选择模块
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
      scope_incremental = "<TAB>",
    },
  },
  -- 启用代码缩进模块 (=)
  indent = {
    enable = true,
  },
})

local auto_indent = vim.api.nvim_create_augroup("AUTO_INDENT", {clear=true})
vim.api.nvim_create_autocmd({"BufWritePost"}, {
  pattern = "*",
  group = auto_indent,
  command = 'normal! gg=G``'
})
