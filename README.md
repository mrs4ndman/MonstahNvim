#### Para toda la vaina chula, necesitas una Nerdfont, `rg`, `fd` y alguna cosilla más.
### Instrucciones, por si no sabes donde está algo:
#### El resto de cosas ya las decides tú, que son preferencia del usuario ;)

```bash
mv ~/.config/nvim ~/.config/nvim_bak
git clone git@github.com:mrs4ndman/MonstahNvim.git ~/.config/nvim
nvim
```

#### Si no sabes lo que te falta, `:checkhealth` te debería ayudar.

- `lua/plugins/autocompletado.lua` -> nvim-cmp para el autocompletado
- `lua/plugins/colores.lua` -> Catppuccin y demás temas de colores que pongas, la instalación ahí.
- `lua/pluigns/formatter.lua` -> Plugin para dar formato con una herramienta a los buffers (lua va con el stylua.toml), mira [aquí](https://github.com/mhartington/formatter.nvim) para instrucciones
- `lua/plugins/gitsigns.lua` -> Configuración del gitsigns, para el buen diff de git sin salir de nvim
- `lua/plugins/harpoon.lua` -> Configuración de harpoon
- `lua/plugins/indentado.lua` -> Guía de indentado minimalista
- `lua/plugins/inicio.lua` -> Pantalla de inicio, por si quieres tocar las entradas, te dejo una de ejemplo.
- `lua/plugins/juegitos.lua` -> Unos plugins para jugar, entretenerse / entrenar skills.
- `lua/plugins/lastplace` -> Tu NeoVim recuerda por ti donde te quedaste en un archivo.
- `lua/plugins/lsp.lua` -> Conjunto de plugins que arrancan con el LSP, junto con Mason suelen ser un paquete
- `lua/plugins/mason-lsp.lua` -> Autoinstala los LSPs que le digas
- `lua/plugins/mason.lua` -> Gestor de LSP, formatters y linters
- `lua/plugins/neotree.lua` -> Por si quieres un explorador de árbol estilo VS Code
- `lua/plugins/noice.lua` -> Plugin para la línea de comandos elevada, el estado del LSP y la búsqueda chula
- `lua/plugins/notificaciones.lua` -> Notificaciones de NeoVim al estilo escritorio.
- `lua/plugins/telescope.lua` -> Esencial para navegar, te dejo mi configuración pero la puedes cambiar sin problemas
- `lua/plugins/treesitter.lua` -> Highlighting esencial para programar (aquí puedes definir si quieres instalar alguno en específico). Te he dejado los más comunes
- `lua/plugins/treesj.lua` -> Encoje / estira nodos de texto (CUIDADO, bindeado a la Q mayúscula en modo Normal)
- `lua/plugin/undotree.lua` -> Historial de deshacer
- `lua/plugin/vinegar.lua` -> Acceso directo a Ex ( tecla `-` en modo normal )
- `lua/plugins/which-key.lua` -> Configuración de which-key, para que te diga las teclas ;)
