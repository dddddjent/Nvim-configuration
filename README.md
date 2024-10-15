# My configuration for neovim

## 1. Installation

### Requirements

- gcc make curl wget tar gzip unzip cmake git cargo nodejs
- nodejs/npm: >= 16
  - `wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash`
    - create .bash_profile (the one executed during login) before exe this command
  - `nvm install --lts`

### Install neovim 

Version `c3e176f6e24e2b97603b59bb89b125d540e1274d` with inlay-hint

- download the prebuilt version with correct glibc version
- extract and add it to the env: `export PATH=".../nvim/bin/:$PATH"`

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

- Pyright can only work in root (workspace) mod?

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

## Windows

- `Appdata/Local/nvim`
- `Appdata/Local/nvim-data`

### Install nvim

The locale of the system should be changed to force UTF-8 (the default is gb2312)

- Otherwise it will not compile

### Install Fonts

Nerd font has windows compatible versions. Install that one (check the name of it!)

### Treesitter

Only cl.exe or clang? right now can compile the correct win32 dll, so install it.

### Telescope

fzf native can't work properly on windows (can't recognize win32 dll)

- **To let it create a history**, uncheck `vim.opt.shellslash = true` in option.lua when you run it the first time.
- rg has changed `--hidden` before version 14. It can't accept `--hidden=true` anymore.

### Mason

Mason can only install the servers built on node and python

- Install lua-language-server manually
- cmake-language-server is not able to install by mason. So far **0.1.7** has been the latest version that can run on my windows

### Markdown

It seems like you have to do npm install in app folder of that plugin manually?

- If it doesn't work, then remove the plugin and don't let it install automatically
