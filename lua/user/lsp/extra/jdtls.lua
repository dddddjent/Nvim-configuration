M = {}

local config = {
    cmd = { 'jdtls' },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
}

function M.set_jdtls()
    require('jdtls').start_or_attach(config)
end

return M
