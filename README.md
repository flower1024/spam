# spam
isbg spam filter

# docker-compose
```
    spam:
        image: flower1024/spam
        restart: unless-stopped
        read_only: true
        environment: 
            - SA_CHANNELS=spamassassin.heinlein-support.de sa.schaal-it.net updates.spamassassin.org
            - IMAPINBOX=INBOX
            - SPAMINBOX=INBOX.spambucket
            - LEARNINBOX=INBOX.spambucket.spam
            - LEARNHAMBOX=INBOX.spambucket.ham
            - MAILUSER=username
            - MAILPASS=mail password
            - MAILSERVER=mail server
        tmpfs:
            - /run
        volumes: 
            - /srv/volumes/spam/isbg:/home/spam
            - /srv/volumes/spam/spamassassin:/var/lib/spamassassin
            - /srv/volumes/tmp/spam:/tmp
```
