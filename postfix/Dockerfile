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

RUN postconf -e inet_protocols=ipv4 

EXPOSE 25

COPY run /usr/bin/start-postfix
COPY smtp_restrictions /tmp/smtp_restrictions

RUN cat /tmp/smtp_restrictions >> /etc/postfix/main.cf && \
      rm /tmp/smtp_restrictions


ENTRYPOINT ["/usr/bin/start-postfix"]
