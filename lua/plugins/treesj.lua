return {
  "Wansmer/treesj",
  cmd = { "TSJJoin", "TSJSplit", "TSJToggle" },
  -- Tecla con la que togglear los nodos de treesitter
  keys = {
    { "Q", "<cmd>TSJToggle<CR>", desc = "Toggle TS node" },
  },
  opts = {
    use_default_keymaps = false,
    check_syntax_error = false,
    -- Máxima longitud del nodo a comprimir / estirar
    max_join_length = 300,
    cursor_behaviour = "hold",
    notify = true,
    dot_repeat = true,
  }
}
