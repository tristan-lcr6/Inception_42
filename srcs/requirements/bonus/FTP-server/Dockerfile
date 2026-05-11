FROM debian:bookworm

RUN apt-get update && apt-get install -y \
     vsftpd && rm -rf /var/lib/apt/lists/*

COPY ftp-setup.sh /usr/local/bin/ftp-setup.sh

RUN mkdir -p /var/run/vsftpd/empty && chmod 555 /var/run/vsftpd/empty
RUN chmod +x /usr/local/bin/ftp-setup.sh

RUN apt-get update && apt-get install -y \
    vsftpd \
    adduser \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 21
EXPOSE 21000-21010

ENTRYPOINT ["ftp-setup.sh"]