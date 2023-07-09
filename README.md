# My configuration for neovim

for Mason, wget needs proxy

1. PackerSync
2. TSUpdateSync
3. Install

   - ripgrep
   - lazygit
   - zstd _If you want to install zls using Mason. It needs this to decompress it on Windows_

4. For cpp
   - gcc/g++
   - cmake _On windows, the install of everything related to pip should be without proxy..._
   - ninja
5. Intall from Mason:

   - codelldb
   - autopep8
   - clang-format
   - cmakelint
   - cmakelang
   - debugpy
   - prettier
   - latexindent

   - Something cannot be installed from Mason: + Verilator, for verilog (svlangserver needs it to lint)
     <br/>

6. Add new debuggers:

   - add new adapter
   - add the configuration in whichkey(<leader>dR) and dap-config (for start up)

7. Tips
   - _clangd:_ <br/>
   `clang-format -style=webkit -dump-config > .clang-format`
