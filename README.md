# Neovim Configuration

This repository contains my personal Neovim configuration. The actual
configuration files live inside the `nvim/` directory and use Lua modules
for most of the setup.

## Features

- Plugin management with [packer.nvim](https://github.com/wbthomason/packer.nvim)
- One Dark theme
- File tree with `nvim-tree`
- Telescope for fuzzy finding
- LSP support via `mason.nvim` and `nvim-lspconfig`
- Treesitter based syntax highlighting
- Integrated terminal with `toggleterm.nvim`
- Which-key helper showing available mappings
- Clojure support with `conjure`

## Installation

1. **Clone this repository** somewhere on your machine:

   ```bash
   git clone <repo-url> ~/dev/neovim-config
   ```

2. **Point Neovim to use these configs**. The easiest way is creating a
   symbolic link from your Neovim configuration directory to the `nvim`
   folder in this repository:

   ```bash
   mkdir -p ~/.config
   ln -s ~/dev/neovim-config/nvim ~/.config/nvim
   ```

   Adjust the paths above if you cloned the repository elsewhere.

3. **Launch Neovim**. On the first launch Packer will automatically clone
   itself and install all plugins:

   ```bash
   nvim
   ```

   After the installation finishes, restart Neovim to load all plugins
   correctly.

## Updating plugins

Run the following command inside Neovim whenever you want to update the
plugins:

```vim
:PackerSync
```

## Notes

- The file `nvim/plugin/packer_compiled.lua` is generated automatically by
  Packer and is ignored from version control.
- Some language servers may require extra tools installed on your system.
  Check their documentation if they fail to start.

