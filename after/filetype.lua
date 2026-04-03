-- Custom filetype detection.
-- Fixes :checkhealth warning for docker_compose_language_service expecting `yaml.docker-compose`.

vim.filetype.add({
    -- Explicit filenames take precedence over generic *.yml/*.yaml -> yaml detection.
    filename = {
        ["docker-compose.yml"] = "yaml.docker-compose",
        ["docker-compose.yaml"] = "yaml.docker-compose",
        ["compose.yml"] = "yaml.docker-compose",
        ["compose.yaml"] = "yaml.docker-compose",
    },
    -- Support common variants like docker-compose.override.yml / docker-compose.dev.yaml.
    -- NOTE: Lua patterns don't support `?` as an "optional" operator, so we list yml/yaml explicitly.
    pattern = {
        ["docker%-compose%..*%.yml"] = "yaml.docker-compose",
        ["docker%-compose%..*%.yaml"] = "yaml.docker-compose",
        ["compose%..*%.yml"] = "yaml.docker-compose",
        ["compose%..*%.yaml"] = "yaml.docker-compose",
    },
})

-- Ensure Treesitter uses the YAML parser for docker-compose files.
pcall(function()
    vim.treesitter.language.register("yaml", "yaml.docker-compose")
end)
