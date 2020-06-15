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

# Postfix logs by default to syslog. We will need to redirect it to file
RUN postconf -e maillog_file=/var/log/mail.log && \
    touch /var/log/mail.log

EXPOSE 25 587

COPY run /usr/bin/start-postfix

ENTRYPOINT ["/usr/bin/start-postfix"]
