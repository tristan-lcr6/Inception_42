FROM debian:bookworm

RUN apt-get update && apt-get install -y \
     vsftpd && rm -rf /var/lib/apt/lists/*

COPY ftp-setup.sh /usr/local/bin/ftp-setup.sh

RUN chmod +x /usr/local/bin/ftp-setup.sh

EXPOSE 21
EXPOSE 21000-21010

ENTRYPOINT ["ftp-setup.sh"]