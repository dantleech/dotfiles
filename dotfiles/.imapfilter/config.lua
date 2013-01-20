---------------
--  Options  --
---------------

options.timeout = 120
options.subscribe = true


----------------
--  Accounts  --
----------------

-- Connects to "imap1.mail.server", as user "user1" with "secret1" as
-- password.
dantleech = IMAP {
    server = 'www.dantleech.com',
    username = 'daniel',
    password = 'athooX9A'
}

-----------------
--  Mailboxes  --
-----------------

msgs = dantleech.INBOX:contain_to('symfony@noreply.github.com')
dantleech.INBOX:move_messages(dantleech['github/symfony'], msgs)

msgs = dantleech.INBOX:contain_to('yProx@noreply.github.com')
dantleech.INBOX:move_messages(dantleech['github/yprox'], msgs)
