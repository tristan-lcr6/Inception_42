FROM debian:bookworm

RUN apt update && apt install -y netdata

# Écouter sur toutes les interfaces, pas seulement localhost
RUN sed -i 's/bind socket to IP = 127.0.0.1/bind socket to IP = 0.0.0.0/' /etc/netdata/netdata.conf

EXPOSE 19999

CMD ["netdata", "-D"]