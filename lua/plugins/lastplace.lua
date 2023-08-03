return {
  -- Nada que tocar, funciona solo ;)
  "ethanholz/nvim-lastplace",
  event = "VimEnter",
  config = function()
    require("nvim-lastplace").setup{}
  end
}
