local io = io
local math = math
local naughty = naughty
local beautiful = beautiful
local tonumber = tonumber
local tostring = tostring
local print = print
local pairs = pairs
local string = string

module("battery")

local limits = {{25, 5},
          {12, 3},
          { 7, 1},
            {0}}

function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

function get_bat_state (adapter)
    local batstring = "/sys/class/power_supply/%s/%s"
    local chargenowstr = ""
    local chargefullstr = ""

    -- These files change their names depending on if the laptop is plugged in or not ..
    if file_exists(string.format(batstring, adapter, 'charge_now')) then
        chargenowstr = string.format(batstring, adapter, 'charge_now')
        chargefullstr = string.format(batstring, adapter, 'charge_full')
    else
        chargenowstr = string.format(batstring, adapter, 'energy_now')
        chargefullstr = string.format(batstring, adapter, 'energy_full')
    end

    local fcur = io.open(chargenowstr)
    local fcap = io.open(chargefullstr)
    local fsta = io.open("/sys/class/power_supply/"..adapter.."/status")
    local cur = fcur:read()
    local cap = fcap:read()
    local sta = fsta:read()
    fcur:close()
    fcap:close()
    fsta:close()
    local battery = math.floor(cur * 100 / cap)
    if sta:match("Charging") then
        dir = 1
    elseif sta:match("Discharging") then
        dir = -1
    else
        dir = 0
        battery = "100%"
    end
    return battery, dir
end

function getnextlim (num)
    for ind, pair in pairs(limits) do
        lim = pair[1]; step = pair[2]; nextlim = limits[ind+1][1] or 0
        if num > nextlim then
            repeat
                lim = lim - step
            until num > lim
            if lim < nextlim then
                lim = nextlim
            end
            return lim
        end
    end
end


function batclosure (adapter)
    local nextlim = limits[1][1]
    return function ()
        local prefix = "B:"
        local battery, dir = get_bat_state(adapter)
        if dir == -1 then
            dirsign = "↓"
            prefix = "Bat:"
            if battery <= nextlim then
                naughty.notify({title = "⚡ Beware! ⚡",
                            text = "Battery charge is low ( ⚡ "..battery.."%)!",
                            timeout = 7,
                            position = "bottom_right",
                            fg = beautiful.fg_focus,
                            bg = beautiful.bg_focus
                            })
                nextlim = getnextlim(battery)
            end
        elseif dir == 1 then
            dirsign = "↑"
            nextlim = limits[1][1]
        else
            dirsign = ""
        end
        if dir ~= 0 then battery = battery.."%" end
        local ret = " "..prefix.." "..dirsign..battery.." "
        ret = '<span foreground="yellow">' .. ret .. '</span>'
        return ret
    end
end

function bat_remaining ()
    return function () 
        local fd=io.popen("acpi", "r") --list present batteries
        local line=fd:read()
        return line
    end
end
-- print(get_bat_state("BAT0"))

