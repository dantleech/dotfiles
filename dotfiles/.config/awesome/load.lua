function load_uptime()
   local h = io.popen("uptime", "r")
   local out = h:read()
   local load_average = string.match(out, 'load average: (.*)')
   local uptime = string.match(out, 'up ([0-9]+ days?)')
   if (not uptime) then
       uptime = '0 days'
   end
   local message = '<span foreground="lightgreen">up ' .. uptime ..'</span> <span foreground="yellow">' .. load_average .. '</span>'
   return message
end

print(load_uptime())
