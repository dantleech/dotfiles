webview.methods.browse_hist_dmenu = function( view, w )
    local scripts_dir = luakit.data_dir .. "/scripts" 
    local hist_file = luakit.data_dir .. "/history.db" 
    local query = "select uri, title, datetime(last_visit,'unixepoch') from history order by last_visit DESC;" 
    local dmenu = "dmenu -t -l 10" 
    -- AFAIK, luakit will urlencode spaces in uri's so this crude cut call should work fine.
    local fh = io.popen( "sh -c 23f4dde21003316346b32f61cdb293881bc313b9quot;echo \23f4dde21003316346b32f61cdb293881bc313b9quot;" .. query .. "\23f4dde21003316346b32f61cdb293881bc313b9quot; | sqlite3 " .. hist_file .. " | sed 's#|#  #' | " .. dmenu .. " | cut -d' ' -f123f4dde21003316346b32f61cdb293881bc313b9quot;" , "r" )
    local selection = fh:read( "*a" )
    fh:close()
    if selection ~= "" then w:navigate( selection ) end
end
