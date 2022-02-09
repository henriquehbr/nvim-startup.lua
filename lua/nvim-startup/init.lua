local M = {}

M.setup = function(options)
    local opts = options or {}
    opts.startup_file = opts.startup_file or "/tmp/nvim-startuptime"
    opts.message = opts.message or "nvim-startup: launched in {}"

    local startup_time_pattern = "([%d.]+)  [%d.]+: [-]+ NVIM STARTED [-]+"

    -- read startup time file
    local startup_time_file = io.open(opts.startup_file) and
                                  io.open(opts.startup_file):read "*all" or nil

    -- get startup time and converts to number (in case `message` is function)
    local startup_time = startup_time_file and
                             tonumber(
            startup_time_file:match(startup_time_pattern)
        ) or nil

    if startup_time_file and startup_time then
        -- replace the message `{}` placeholder with the startup time
        local template_message = type(opts.message) == "function" and
                                     opts.message(startup_time) or opts.message
        local message = template_message:gsub("{}", startup_time .. " ms")
        print(message)
        return startup_time
    elseif startup_time_file and not startup_time then
        print "nvim-startup: running on the next (n)vim instance"
    else
        print(
            "nvim-startup: startup time log not found (" .. opts.startup_file ..
                ")"
        )
    end

    -- clear startup time log
    -- removing it causes some cache related issues (hyphothesis)
    io.open(opts.startup_file, "w"):close()
end

return M
