local file_exists = require 'nvim-startup.file_exists'

local g = vim.g

-- global variables
g.nvim_startup_file = g.nvim_startup_file or '/tmp/nvim-startuptime'

if not file_exists(g.nvim_startup_file) then return nil end

local startup_time = io.open(g.nvim_startup_file)
    :read('*a')
    :match('([%d.]+)  [%d.]+: [-]+ NVIM STARTED [-]+')

-- clear startup time log
-- removing it causes some cache related issues (hyphothesis)
io.open(g.nvim_startup_file, 'w'):close()

print('Launched in ' .. startup_time .. ' ms')
