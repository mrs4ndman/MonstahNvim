return {
  "mbbill/undotree",
  cmd = "UndotreeToggle",
  keys = {
    { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Undo-tree Toggle" },
  },
  -- Enfocar la ventana de undotree cuando la usamos, y volver a la anterior al cerrar
  config = function()
    vim.g.undotree_SetFocusWhenToggle = 1
  end
}
