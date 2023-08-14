# Neovim configuration with Lua

A [Neovim](https://github.com/neovim/neovim) configuration using Lua, with the minimal number of pluggins I need for programming. Different language servers available through the LSP protocol provide code completion and analysis.

This readme exist so I don't have to remember how to do all these things when setting up a new machine.

## Setting up

Notice that Neovim doesn't have a full release version number yet. This is because it is undergoing rapid development and older versions could be incompatible with some plugins. The latest version can always be installe using the instructions below depending on your operating system.

### MacOS

Assume `brew` is installed, then installing Neovim is straighforward:

```bash
# For stable version
brew install neovim

# To update
brew reinstall neovim
```

## Installing the configuration

Clone the repo into Neovim's installation folder (usually `/home/<usr>/.config/nvim`):
```bash
git clone https://github.com/peco8/neovim-config.git ~/.config/nvim
```

This will create a folder with the configuration with the following structure is as follows:
```
├── README.md
├── init.lua
├── lazy-lock.json
└── lua
    └── core
        ├── keymaps.lua
        ├── options.lua
        ├── plugin_config
        │   ├── colorscheme.lua
        │   ├── completion.lua
        │   ├── dap_config.lua
        │   ├── gistsigns.lua
        │   ├── gopher.lua
        │   ├── init.lua
        │   ├── lsp_config.lua
        │   ├── lualine.lua
        │   ├── null-ls.lua
        │   ├── nvim-tree.lua
        │   ├── oil_config.lua
        │   ├── telescope.lua
        │   └── treesitter.lua
        └── plugins.lua
```

This structure is important since Lua will not load files that are not located inside `lua`. The file `init.lua` loads all the modules located inside this folder to set the configuration. Most of the names are self explanatory. The most important file here is `plugins.lua`, which is the module that loads the relevant plugins.
