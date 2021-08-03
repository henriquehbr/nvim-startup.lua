package = "nvim_startup"
version = "dev-1"
source = {
    url = "git+https://github.com/henriquehbr/nvim-startup.lua"
}
description = {
    summary = "> minimalistic startup time feedback",
    detailed = "> minimalistic startup time feedback",
    homepage = "https://github.com/henriquehbr/nvim-startup.lua",
    license = "*** please specify a license ***"
}
dependencies = {
    "lua >= 5.4",
    "luacheck >= 0.24.0-2"
}
build = {
    type = "builtin",
    modules = {
        ["nvim-startup.init"] = "lua/nvim-startup/init.lua"
    }
}
