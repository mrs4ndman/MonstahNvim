return {
  "ethanholz/nvim-lastplace",
  event = "VimEnter",
  config = function()
    require("nvim-lastplace").setup{}
  end
}
