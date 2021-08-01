local file_exists = require 'file_exists'

-- global variables
local g = vim.g
g.nvim_startup_file = g.nvim_startup_file or '/tmp/nvim-startuptime'

local function display_startup_time()
    -- closes file handle and returns "nil" in case the file doesn't exists
    if not file_exists(vim.g.nvim_startup_file) then return nil end

    -- gets the latest line from vim startup log
    -- Lua has it's own pattern matching syntax, mainly because
    -- a regex library would already be larger than lua itself
    local startup_time = io.open(g.nvim_startup_file)
        :read('*a')
        :match('([%d.]+)  [%d.]+: [-]+ NVIM STARTED [-]+')

    -- clear startup time log
    -- removing it causes some cache related issues (hyphothesis)
    io.open(g.nvim_startup_file):close()

    print('Launched in ' .. startup_time .. ' ms')
end

return {
    display_startup_time = display_startup_time
}
