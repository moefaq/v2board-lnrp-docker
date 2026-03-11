# syntax=docker/dockerfile:1-labs
FROM alpine:3.15
RUN apk update && \
    apk add --no-cache mariadb-client bash nginx redis php8 curl supervisor php8-zlib php8-xml php8-phar php8-intl php8-dom php8-xmlreader php8-ctype php8-session php8-mbstring php8-tokenizer php8-gd php8-redis php8-bcmath php8-iconv php8-pdo php8-posix php8-gettext php8-simplexml php8-sodium php8-sysvsem php8-fpm php8-mysqli php8-json php8-openssl php8-curl php8-sockets php8-zip php8-pdo_mysql php8-xmlwriter php8-opcache php8-gmp php8-pdo_sqlite php8-sqlite3 php8-pcntl php8-fileinfo git mailcap && \
    ln -sf /usr/bin/php8 /usr/bin/php && \
    ln -sf /usr/sbin/php-fpm8 /usr/sbin/php-fpm
ADD asset/ /
ADD --keep-git-dir=true https://github.com/wyx2685/v2board.git /data/wwwroot
ENTRYPOINT [ "/docker-entrypoint.sh" ]
EXPOSE 80 443
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
