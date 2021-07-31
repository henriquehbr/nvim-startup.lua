require 'file_exists'

local function display_startup_time()
    local startup_time_file_path = '/tmp/nvim-startuptime'
    local startup_time_file = io.open(startup_time_file_path)

    -- closes file handle and returns "nil" in case the file doesn't exists
    if not file_exists(startup_time_file_path) then return nil end

    -- gets the latest line from vim startup log
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
