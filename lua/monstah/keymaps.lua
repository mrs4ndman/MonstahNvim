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
