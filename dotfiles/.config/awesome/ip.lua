function get_ip()
   local h = io.popen("ip -o -f inet addr", "r")
   local info = ''
   for line in  h:lines() do
       local _, _, interface, ip = string.find(line, "%d: (%w+).*inet (%d+.%d+.%d+.%d+)")
       if ip and not (interface == "lo") then
           info = info .. '<span foreground="pink">' .. interface ..': ' .. ip .. '</span> '
       end
   end

   return info
end
