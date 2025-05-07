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
    curl -s -L https://go.dev/dl/go1.24.0.linux-amd64.tar.gz | tar -C /usr/local -xzf - && \
    curl -OL https://raw.githubusercontent.com/l3murr/build_tools/main/cargo-php && chmod +x /cargo-php && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    curl -o /git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash && \
    curl -fsSL https://code-server.dev/install.sh | sh
RUN echo '[PHP]\n\
log_errors = on\n\
short_open_tag = on\n\
display_errors = on\n\
display_startup_errors = on\n\
error_reporting = E_ALL ^ E_NOTICE ^ E_WARNING\n\
error_log = /var/log/apache2/php-error.log\n\
precision = 10\n\
serialize_precision = 10\n\
memory_limit = 256M\n\

xdebug.extension=xdebug.so\n\
xdebug.start_with_request=1\n\
xdebug.discover_client_host=1\n\
xdebug.remote_cookie_expire_time = 3600\n\
xdebug.client_host = 127.0.0.1\n\
xdebug.client_port = 9999\n\
xdebug.remote_handler = dbgp\n\
xdebug.mode = debug,develop\n\
xdebug.idekey="PHPSTORM"\n\
extension=/var/www/html/backend/ext/libtms_platform_extension.so' >> /etc/php/8.3/cli/php.ini
RUN echo '#!/bin/sh\n\
cd /var/www/html\n\
mkdir /var/run/php\n\
if [ ! -f /root/.bashrc ]; then\n\
    echo ". /git-completion.bash\nexport PATH=\"/usr/local/go/bin:$PATH\"" > /root/.bashrc\n\
fi\n\
if [ -f /var/www/html/README.md ]; then\n\
  echo "chowning /var/www/html/backend/storage/ for www-data"\n\
  chown -R www-data:www-data /var/www/html/backend/storage/\n\
else\n\
  curl https://sh.rustup.rs -sSf | bash -s -- -y\n\
  /root/.cargo/bin/rustup install nightly-2024-05-20\n\
  /root/.cargo/bin/cargo install wasm-pack\n\
  npm install -g typescript@5.8.3
  rm -rf /var/www/html/*\n\
  GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" git clone git@github.com:Timeless-Medical-International/tmnp.git /var/www/html\n\
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
/usr/bin/supervisord & tail -f /dev/null'\
>> /docker-entrypoint.sh
RUN echo '[program:code-server]\n\
command=code-server --auth none --host 0.0.0.0\n\
autostart=true\n\
autorestart=true'\
>> /etc/supervisor/conf.d/code-server.conf
RUN echo '[program:rr]\n\
command=rr serve -c /var/www/html/backend/.rr.yaml\n\
autostart=true\n\
autorestart=true'\
>> /etc/supervisor/conf.d/rr.conf
RUN dos2unix /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

WORKDIR /var/www/html
ENTRYPOINT "/docker-entrypoint.sh"
