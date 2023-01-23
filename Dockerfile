FROM debian:sid

RUN set -ex\
    && apt update -y \
    && apt upgrade -y \
    && apt install -y wget unzip qrencode\
    && apt install -y shadowsocks-libev\
    && apt install -y nginx\
    && apt autoremove -y

COPY nginx_ss.conf /nginx_ss.conf
COPY shadowsocks-libev_config.json /shadowsocks-libev_config.json
COPY entrypoint.sh /entrypoint.sh
COPY v2 /v2

RUN chmod +x /v2
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
