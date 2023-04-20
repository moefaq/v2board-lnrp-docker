#!/bin/sh

echo "Waiting for Database"
until mysql -h"${DB_HOST}" -u"${DB_USERNAME}" -p"${DB_PASSWORD}" &> /dev/null
do
    >&2 echo -n "."
    sleep 1
done
>&2 echo -e "\nDatabase is up..."

if [ ! -e "/data/initialized" ]; then
    
#     cat > /data/tls/tls.cer << EOF
# ${NGINX_CERT_TEXT}
# EOF
    
#     cat > /data/tls/tls.key << EOF
# ${NGINX_KEY_TEXT}
# EOF
    
    cd /data/wwwroot/
    wget https://github.com/composer/composer/releases/latest/download/composer.phar -O composer.phar
    php composer.phar install -v
    
    cat > /data/answerdata << EOF
${DB_HOST}
${DB_DATABASE}
${DB_USERNAME}
${DB_PASSWORD}
${ADMIN_EMAIL}
EOF
    
    php artisan v2board:install < /data/answerdata
    
    touch /data/initialized
fi

exec "$@"