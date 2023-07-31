
-- Para ver los colores precisos dentro de kitty / alacritty.
vim.opt.termguicolors = true

-- Números relativos combinados con normales
vim.opt.number = true
vim.opt.relativenumber = true

-- Altura máxima de la ventana de autcompletado ( en líneas de terminal )
vim.o.pumheight = 20

-- Cantidad y comportamiento de los símbolos de la derecha de los números
vim.opt.signcolumn = "auto:1-4"

-- Timeout para las keybinds ( en ms )
vim.opt.timeoutlen = 500

-- Indentación
vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Vim indenting
vim.opt.smartindent = true
vim.opt.breakindent = true


-- ESTO VA CON EL UNDOTREE
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true
