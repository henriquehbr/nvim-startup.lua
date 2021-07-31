function file_exists(name)
    local file = io.open(name)
    if file == nil then
        print('nvim-startup: couldn\'t retrieve startup time log file (' .. name .. ')')
        return nil
    end
    file:close()
    return true
end
