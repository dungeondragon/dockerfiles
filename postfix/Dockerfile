FROM debian:buster-slim

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
      --no-install-recommends \
      --no-install-suggests \
      postfix

RUN apt-get clean && \
      apt-get autoremove --purge -y && \
      rm -rf /var/lib/apt/lists/*

# Redirect default Postfix logging from syslog to file
RUN postconf -e maillog_file=/var/log/mail.log && \
    touch /var/log/mail.log

# Append virtual mailbox configuration to the main config
COPY vmailbox.cf /tmp/vmailbox.cf    
RUN cat /tmp/vmailbox.cf >> /etc/postfix/main.cf && \
    rm -f /tmp/vmailbox.cf


EXPOSE 25 587

COPY run /usr/bin/start-postfix

ENTRYPOINT ["/usr/bin/start-postfix"]
