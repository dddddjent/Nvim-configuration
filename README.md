# My configuration for neovim

## 1. Installation

### Requirements

- gcc make curl wget tar gzip unzip cmake git cargo nodejs
- nodejs/npm: >= 16
  - `wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash`
    - create .bash_profile (the one executed during login) before exe this command
  - `nvm install --lts`

### Clone

```bash
git clone --recursive https://github.com/dddddjent/Nvim-configuration.git ~/.config/nvim/
cd ~/.config/nvim
```

- Fonts are under fonts/ directory

### Language specific

Mason may need:

- python venv/cmake
- go
- nodejs/npm: >= 16

**None of the servers are installed automatically! (except lua-ls)**

- Read lsp/init.lua to install servers

#### Cpp

- ninja
- _clangd:_ `clang-format -style=webkit -dump-config > .clang-format`

#### Python

Maybe stubs need to be installed manually in Lazy

#### Rust

It seems like `rust-src` is necessary for rust-analyzer to work properly

#### Zig

- zstd _If you want to install zls using Mason. It needs this to decompress it on Windows_

#### Verilog

- Something cannot be installed from Mason: + Verilator, for verilog (svlangserver needs it to lint)

## 2. Keymaps

- `<leader>dr`: reload tasks
- `<leader>dR`: reload dap launches
- `<leader>pC`: setup task.json&launch.json
- `tp`: open up jsons

## 3. Add new LSP/Null-ls client

### LSP

1. Add the name in lsp/init.lua
2. Add alternative options in servers/
   - `lspconfig`: for nvim-lspconfig
   - `is_format_disabled`: to disable the format capabilities
   - `ensure_installed`: whether install automatically

### Null-ls

1. Add the name in lsp/init.lua
2. Add the config in null-ls.lua

## 4. Add new dap

1. Add a new adapter
2. See if you need extra mappings to map adapter to the filetype
