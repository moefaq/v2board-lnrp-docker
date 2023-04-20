# syntax=docker/dockerfile:1-labs
FROM alpine:3.15
RUN apk update
RUN apk add --no-cache mysql-client bash nginx redis php7 curl supervisor php7-zlib php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype php7-session php7-mbstring php7-tokenizer php7-gd php7-redis php7-bcmath php7-iconv php7-pdo php7-posix php7-gettext php7-simplexml php7-sodium php7-sysvsem php7-fpm php7-mysqli php7-json php7-openssl php7-curl php7-sockets php7-zip php7-pdo_mysql php7-xmlwriter php7-opcache php7-gmp php7-pdo_sqlite php7-sqlite3 php7-pcntl php7-fileinfo git mailcap
ADD asset/ /
ADD --keep-git-dir=true https://github.com/v2board/v2board.git /data/wwwroot
ENTRYPOINT [ "/docker-entrypoint.sh" ]
EXPOSE 80 443
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
