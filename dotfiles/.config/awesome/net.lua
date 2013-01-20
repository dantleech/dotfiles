
global_stats = {}

function _iface_io()
    net = io.open("/proc/net/dev")

    ret = { }

    for line in net:lines() do
        local _, _, iface = string.find(line, "(%w+):")

        if iface then
            ret[iface] = {};
            ret[iface].recv = tonumber(line:match(":%s*(%d+)"))
            ret[iface].send = tonumber(line:match("(%d+)%s+%d+%s+%d+%s+%d+%s+%d+%s+%d+%s+%d+$"))
        end
    end
    net:close()
    return ret
end

function poll()
    local ret = {}
    local stats = _iface_io()
    if next(global_stats) == nil then
        global_stats = stats
    end

    for iface, data in pairs(stats) do
        if not (iface == "lo") then
            ret[iface] = {}
            ret[iface].recv = string.format("%.1f", (data.recv - global_stats[iface].recv) / 1000)
            ret[iface].send = string.format("%.1f", (data.send - global_stats[iface].send) / 1000)
        end
    end

    global_stats = stats;

    return ret
end

function get_iface_io_rate()
    local poll = poll()
    local ret = ''

    for iface, data in pairs(poll) do
       ret = ret .. '<span foreground="white">' .. iface ..': ' .. string.format("%6s", data.recv)  .. ' / ' .. string.format("%-6s", data.send) ..'</span> '
    end

    return ret
end

print(get_iface_io_rate())
