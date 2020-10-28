FROM flower1024/ghost-python3

ARG UID=82
ARG GID=82

COPY /app /app/

RUN apt-get -y -q install spamassassin imapfilter razor spamc re2c sa-compile && \
    yes | pip3 install isbg pyzor && \
    chmod ugo+x -R /app/init && \
    chmod ugo+x -R /app/scripts && \
    chmod ugo+x -R /app/start && \
    USER spam ${UID} spam ${GID} && \
    echo "0 1 * * * /app/scripts/update.sh" > /var/spool/cron/crontabs/root && \
    echo "* * * * * /app/scripts/filter.sh" > /var/spool/cron/crontabs/spam && \
    echo "10 * * * * /app/scripts/expire.sh" >> /var/spool/cron/crontabs/spam

VOLUME [ "/home/spam", "/var/lib/spamassassin" ]
