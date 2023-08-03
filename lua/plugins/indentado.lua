return {
  -- Te detecta el indentado automáticamente, no interfiere con el formatter
  "tpope/vim-sleuth",
  event = { "BufReadPost", "BufNewFile" },
}
