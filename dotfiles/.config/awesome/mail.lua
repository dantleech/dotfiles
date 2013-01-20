local mailboxes = { 
    cmf = '~/mail/dantleech/github.cmf',
    ibx = '~/mail/dantleech/INBOX' ,
    sfg = '~/mail/dantleech/github.symfony',
}
function get_mail_status()
    local ret = ''
    for alias, box in pairs(mailboxes) do
        local h = io.popen('find ' .. box .. ' -wholename */new/* -type f | wc -l')
        local count = h:read()
        ret = ret .. alias .. ' ' .. count .. ' '
    end

    return '<span foreground="lightgreen">' .. ret .. '</span>'
end

print(get_mail_status())
