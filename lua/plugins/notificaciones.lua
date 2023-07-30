return {
  "rcarriga/nvim-notify",
  event = "VimEnter",
  opts = {
    -- Tipo de animación
    stages = "static",
    -- El tiempo que te duran en pantalla
    timeout = 1500,
    render = "compact",
    -- Altura máxima
    max_height = function()
      return math.floor(vim.o.lines * 0.40)
    end,
    -- Anchura máxima
    max_width = function()
      return math.floor(vim.o.columns * 0.70)
    end,
  },
  config = function()
    vim.notify = require("notify")
  end,
}
