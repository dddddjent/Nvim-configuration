local config = {
    cmd = { 'jdtls' },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.gradlew', '.git', 'mvnw' }, { upward = true })[1]),
}
-- require('jdtls').start_or_attach(config)

vim.cmd [[
  augroup _lsp 
      autocmd! 
      autocmd FileType java lua require('jdtls').start_or_attach({cmd = { 'jdtls' },root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.gradlew', '.git', 'mvnw' }, { upward = true })[1]),})
  augroup end
]]
