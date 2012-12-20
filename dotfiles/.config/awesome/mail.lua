local mailboxes = { dtl = '~/mail/dantleech/INBOX', ylly = '~/mail/ylly/INBOX' }
function get_mail_status()
    local ret = ''
    for alias, box in pairs(mailboxes) do
        local h = io.popen('find ' .. box .. ' -wholename */new/* -type f | wc -l')
        local count = h:read()
        ret = ret .. alias .. ' ' .. count .. ' '
    end

    return '<span foreground="green">M: ' .. ret .. '</span>'
end

print(get_mail_status())
