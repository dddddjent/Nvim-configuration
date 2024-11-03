-- Shipwright lua/user/colorschemes/lush/shipwright_build.lua
local lushwright = require("shipwright.transform.lush")
run(require("user.colorschemes.lush." .. COLORSCHEME),
    lushwright.to_lua,
    {
        patchwrite,
        "lua/user/colorschemes/lush/colorscheme.lua",
        "-- PATCH_OPEN",
        "-- PATCH_CLOSE"
    })
