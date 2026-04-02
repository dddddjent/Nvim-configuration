-- You need to put to let it run without workspace
-- # file: $HOME/.taplo.toml
-- #:schema https://json.schemastore.org/taplo.json
--
-- include = ["**/*.toml", "**/*.toml.tmpl"]

return {
    cmd = { MISE_DEP_DIR .. '/taplo/latest/taplo', 'lsp', 'stdio' },
}
