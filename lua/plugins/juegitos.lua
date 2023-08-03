return {
  -- Para entrenar las motions
  {
    "ThePrimeagen/vim-be-good",
    cmd = "VimBeGood",
  },
  -- Para echarte un Tetris
  {
    "alec-gibson/nvim-tetris",
    cmd = "Tetris",
    keys = {
      { "<leader>T", "<cmd>Tetris<CR>", desc = "Tetris" },
    },
  },
  -- Animaciones chulas
  {
    "eandrju/cellular-automaton.nvim",
    keys = {
      { "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "Cool animation" },
    },
  }
}
