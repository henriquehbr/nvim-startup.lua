local g = vim.g

-- global variables
g.nvim_startup_file = g.nvim_startup_file or '/tmp/nvim-startuptime'

local startup_time_file = io.open(g.nvim_startup_file):read('*all')

if string.len(startup_time_file) > 0 then
    local startup_time_pattern = '([%d.]+)  [%d.]+: [-]+ NVIM STARTED [-]+'
    local startup_time = startup_time_file:match(startup_time_pattern)

    -- clear startup time log
    -- removing it causes some cache related issues (hyphothesis)
    io.open(g.nvim_startup_file, 'w'):close()

    print('nvim-startup: launched in ' .. startup_time .. ' ms')
else
    print('nvim-startup: running on the next (n)vim instance')
end
