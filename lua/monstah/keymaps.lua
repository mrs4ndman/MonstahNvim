-- ALGUNOS BÁSICOS QUE VIENEN BIEN
-- LOS PUEDES QUITAR SI NO TE GUSTAN
-- Mantener el cursor en el medio cuando saltamos:
-- Al buscar un término,
vim.keymap.set("n", "n", "nzzzv", { silent = true })
vim.keymap.set("n", "N", "Nzzzv", { silent = true })

-- al saltar párrafos,
vim.keymap.set("n", "{", "{zzzv", { silent = true })
vim.keymap.set("n", "}", "}zzzv", { silent = true })
vim.keymap.set("n", "(", "(zzzv", { silent = true })
vim.keymap.set("n", ")", ")zzzv", { silent = true })

-- O al bajar / subir en la página
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })

-- Sácame de INSERT, ayudaaaaaaa!
vim.keymap.set("i", "<C-c>", "<Esc>", { silent = true })

-- Para indentar mejor al seleccionar código en VISUAL
vim.keymap.set("v", "<", "<gv", { silent = true })
vim.keymap.set("v", ">", ">gv", { silent = true })

-- Atajos de Lazy y Mason
vim.keymap.set("n", "<leader>lz", "<cmd>Lazy<CR>", { desc = "Lazy", noremap = true, silent = true })
vim.keymap.set("n", "<leader>mp", "<cmd>Mason<CR>", { desc = "Mason", noremap = true, silent = true })

-- Para quitarte las notificaciones de encima, no te quita funcionalidad ;)
vim.keymap.set("n", "<esc>", function() require("notify").dismiss() end, { desc = "No notis" })
