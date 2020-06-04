FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive

# Install bind9
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
      --no-install-recommends \
      --no-install-suggests \
      bind9

# Create directory for the process pid and set correct ownership
RUN mkdir -p /var/run/named /etc/bind/zones && \
      chmod 775 /var/run/named && \
      chown root:bind /var/run/named > /dev/nul 2>&1

# Clean apt
RUN apt-get clean && \
      apt-get autoremove --purge -y && \
      rm -rf /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/man/??_* \
        /usr/share/man/??

# Optimize I/O speed
VOLUME ["/etc/bind", "/var/cache/bind", "/var/run/named"]

EXPOSE 53
EXPOSE 53/udp

CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind"]
