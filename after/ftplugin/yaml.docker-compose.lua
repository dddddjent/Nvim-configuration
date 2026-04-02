-- Docker Compose YAML.
-- Existence of this ftplugin makes `yaml.docker-compose` a "known" filetype
-- (so `:checkhealth vim.lsp` won't warn), while keeping YAML-like behavior.

vim.bo.commentstring = "# %s"

vim.b.undo_ftplugin = (vim.b.undo_ftplugin or "") .. "|setlocal commentstring<"
