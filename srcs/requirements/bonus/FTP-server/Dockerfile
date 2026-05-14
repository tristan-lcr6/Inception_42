FROM debian:bookworm

RUN apt-get update && apt-get install -y \
     vsftpd && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/vsftpd/empty && chmod 555 /var/run/vsftpd/empty

COPY ftp-setup.sh /usr/local/bin/ftp-setup.sh
RUN chmod +x /usr/local/bin/ftp-setup.sh

EXPOSE 21
EXPOSE 21000-21010

CMD ["ftp-setup.sh"]