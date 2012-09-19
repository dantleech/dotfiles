function get_song()
   local h = io.popen("mpc", "r")
   local status = h:read()
   status = '<span foreground="orange">' .. string.sub(status, -40) .. '</span>'
   return status
end
