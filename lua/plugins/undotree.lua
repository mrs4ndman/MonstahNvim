return {
  "mbbill/undotree",
  cmd = "UndotreeToggle",
  keys = {
    { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Undo-tree Toggle" },
  },
  config = function()
    vim.g.undotree_SetFocusWhenToggle = 1
  end
}
