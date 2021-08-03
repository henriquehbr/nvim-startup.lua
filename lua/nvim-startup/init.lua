local M = {}

M.setup = function(options)
    options = options or {
        startup_file = '/tmp/nvim-startuptime'
    }

    local startup_time_pattern = '([%d.]+)  [%d.]+: [-]+ NVIM STARTED [-]+'

    local startup_time_file = io.open(options.startup_file)
        and io.open(options.startup_file):read('*all')
        or nil

    -- "#" is the length operator, can be used on strings or tables
    local startup_time = startup_time_file
        and startup_time_file:match(startup_time_pattern)
        or nil

    if startup_time_file and startup_time then
        print('nvim-startup: launched in ' .. startup_time .. ' ms')
    elseif startup_time_file and not startup_time then
        print('nvim-startup: running on the next (n)vim instance')
    else
        print('nvim-startup: startup time log not found (' .. options.startup_file .. ')')
    end

    -- clear startup time log
    -- removing it causes some cache related issues (hyphothesis)
    io.open(options.startup_file, 'w'):close()
end

return M
