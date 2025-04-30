FROM ghcr.io/roadrunner-server/roadrunner:2024 AS roadrunner
FROM ubuntu:24.04
COPY --from=roadrunner /usr/bin/rr /usr/local/bin/rr
RUN apt-get update && apt-get install -y tzdata apt-utils
RUN apt-get install -y software-properties-common libterm-readline-gnu-perl curl
RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    NODE_MAJOR=22 && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" > /etc/apt/sources.list.d/nodesource.list && \
    add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y nodejs php8.3 php8.3-mbstring php8.3-mysqli php8.3-bcmath php8.3-gmp \
    git unzip php8.3-xml php8.3-dev libapache2-mod-php8.3 php8.3-curl net-tools dos2unix \               
    php8.3-zip php8.3-xdebug php8.3-soap php8.3-protobuf locales supervisor clang mysql-client libz-dev cmake && \
    apt-get clean && \
    curl https://sh.rustup.rs -sSf | bash -s -- -y && \
    curl -s -L https://go.dev/dl/go1.24.0.linux-amd64.tar.gz | tar -C /usr/local -xzf - && \
    echo 'export PATH="/usr/local/go/bin:$PATH"' >> /root/.bashrc && \
    curl -OL https://raw.githubusercontent.com/l3murr/build_tools/main/cargo-php && chmod +x /cargo-php && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    ~/.cargo/bin/rustup install nightly-2024-05-20 && \
    curl -fsSL https://code-server.dev/install.sh | sh
RUN echo '#!/bin/sh\n\
cd /var/www/html\n\
mkdir /var/run/php\n\
if [ -f /var/www/html/README.md ]; then\n\
    echo "chowning /var/www/html/backend/storage/ for www-data"\n\
    chown -R www-data:www-data /var/www/html/backend/storage/\n\
else\n\
  rm -rf /var/www/html/*\n\
  GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" git clone ssh://url\n\
  git clone git@github.com:Timeless-Medical-International/tmnp.git /var/www/html\n\
  cd /var/www/html/backend\n\
  npm run ext\n\
  composer install\n\
  php artisan migrate:fresh\n\
  php artisan tms:sale-seeder\n\
  npm run gen-entities\n\
  cd /var/www/html/frontend\n\
  npm i\n\
  npm run dev\n\
fi\n\
/usr/bin/supervisord\n\
bash'\
>> /root/docker-entrypoint.sh
RUN echo '#!/bin/sh\n\
command=code-server --auth none --host 0.0.0.0\n\
autostart=true\n\
autorestart=true'\
>> /etc/supervisor/conf.d/code-server.conf
RUN echo '#!/bin/sh\n\
command=rr serve -c /var/www/html/server/.rr.yaml\n\
autostart=true\n\
autorestart=true'\
>> /etc/supervisor/conf.d/rr.conf
RUN dos2unix /root/docker-entrypoint.sh
RUN chmod +x /root/docker-entrypoint.sh

WORKDIR /var/www/html
ENTRYPOINT "/root/docker-entrypoint.sh"
