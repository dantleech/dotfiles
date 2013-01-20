webview.methods.browse_hist_dmenu = function( view, w )
    local scripts_dir = luakit.data_dir .. "/scripts" 
    local hist_file = luakit.data_dir .. "/history.db" 
    local query = "select uri, title, datetime(last_visit,'unixepoch') from history order by last_visit DESC;" 
    local dmenu = "dmenu -l 10" 
    -- AFAIK, luakit will urlencode spaces in uri's so this crude cut call should work fine.
    local fh = io.popen( "echo \"" .. query .. "\" | sqlite3 " .. hist_file .. " | sed 's#|# #' | " .. dmenu .. " | awk -F' ' '{ print $1}'" , "r" )
    local selection = fh:read( "*a" )
    fh:close()
    if selection ~= "" then w:navigate( selection ) end
end
