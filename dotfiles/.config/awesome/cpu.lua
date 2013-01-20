   jiffies = {}
   function activecpu()
       local s = ""
       for line in io.lines("/proc/stat") do
           local cpu, newjiffies = string.match(line, "(cpu%d*)\ +(%d+)")
           if cpu and newjiffies then
               if not jiffies[cpu] then
                   jiffies[cpu] = newjiffies
               end
               --The string.format prevents your task list from jumping around 
               --when CPU usage goes above/below 10%
               s = s .. " " .. cpu .. ": " .. string.format("%02d", newjiffies-jiffies[cpu]) .. "% "
               jiffies[cpu] = newjiffies
           end
           break
       end
       s = '<span foreground="lightblue">' .. s .. '</span>'
       return s
   end

   function temperature()
       local h = io.popen("acpi -t", "r")
       local status = h:read()
       status = string.match(status, 'ok, ([0-9]+)')
       status = status .. "°C"
       status = '<span foreground="lightgreen">' .. status .. '</span>'
       return status
   end
