local startup_time_file_path = '/tmp/nvim-startuptime'

local function display_startup_time()
    local startup_time_file = io.open(startup_time_file_path)

    -- get the latest line from vim startup log
    -- Lua has it's own pattern matching syntax, mainly because
    -- a regex library would already be larger than lua itself
    local startup_time = startup_time_file
        :read('*a')
        :match('([%d.]+)  [%d.]+: [-]+ NVIM STARTED [-]+')

    startup_time_file:close()

    os.remove(startup_time_file_path)

    print('Launched in ' .. startup_time .. ' ms')
end

return {
    display_startup_time = display_startup_time
}
