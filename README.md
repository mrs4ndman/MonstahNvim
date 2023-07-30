#### Para toda la vaina chula, necesitas una Nerdfont, `rg`, `fd` y alguna cosilla más.
### Instrucciones, por si no sabes donde está algo:

```bash
mv ~/.config/nvim ~/.config/nvim_bak
git clone git@github.com:mrs4ndman/MonstahNvim.git ~/.config/nvim
nvim
```

#### Si no sabes lo que te falta, `:checkhealth` te debería ayudar.

- `lua/plugins/colores.lua` -> Catppuccin y demás temas de colores que pongas, la instalación ahí.
- `lua/plugins/inicio.lua` -> Pantalla de inicio, por si quieres tocar las entradas, te dejo una de ejemplo.
- `lua/plugins/noice.lua` -> Plugin para la línea de comandos elevada, el estado del LSP y la búsqueda chula
- `lua/plugins/notificaciones.lua` -> Notificaciones de NeoVim al estilo escritorio.
- `lua/plugins/telescope.lua` -> Esencial para navegar, te dejo mi configuración pero la puedes cambiar sin problemas
- `lua/plugins/lastplace` -> Tu NeoVim recuerda por ti donde te quedaste en un archivo.
- `lua/plugins/juegitos.lua` -> Unos plugins para jugar / entrenar skills.
