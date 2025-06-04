FROM ubuntu:24.04
RUN apt-get update && apt-get install -y tzdata apt-utils
RUN apt-get install -y software-properties-common libterm-readline-gnu-perl curl
RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    NODE_MAJOR=22 && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" > /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && \
    apt-get install -y nodejs git unzip net-tools locales supervisor clang mysql-client libz-dev libssl-dev libmysqlclient-dev protobuf-compiler pkg-config cmake nginx && \
    curl -o /git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash && \
    curl -fsSL https://code-server.dev/install.sh | sh
RUN echo '#!/bin/sh\n\
cd /var/www/html\n\
if [ ! -f /root/.bashrc ]; then\n\
    echo ". /git-completion.bash\nexport PATH=\"/usr/local/go/bin:$PATH\"" > /root/.bashrc\n\
fi\n\
if [ -f /var/www/html/README.md ]; then\n\
  echo "chowning /var/www/html/backend/storage/ for www-data"\n\
  chown -R www-data:www-data /var/www/html/backend/storage/\n\
  nginx\n\
else\n\
  curl https://sh.rustup.rs -sSf | bash -s -- -y\n\
  /root/.cargo/bin/rustup install nightly-2024-05-20\n\
  /root/.cargo/bin/rustup component add rust-analyzer\n\
  /root/.cargo/bin/cargo install wasm-pack\n\
  /root/.cargo/bin/cargo install diesel_cli --no-default-features --features "mysql"\n\
  npm install -g typescript@5.8.3\n\
  rm -rf /var/www/html/*\n\
  GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" git clone git@github.com:Timeless-Medical-International/tmnp.git /var/www/html\n\
  cd /var/www/html/server\n\
  npm run migrate:fresh\n\
  cd /var/www/html/frontend\n\
  npm i\n\
  npm run wasm\n\
  npm run dev\n\
fi\n\
/usr/bin/supervisord & tail -f /dev/null'\
>> /docker-entrypoint.sh
RUN echo 'server {\n\
    listen              80;\n\
\n\
    location /assets/ {\n\
        alias /var/www/html/frontend/dist/assets/;\n\
    }\n\
\n\
    location / {\n\
        proxy_pass http://localhost:3000;\n\
        proxy_set_header Host $host;\n\
    }\n\
}\n\
' > /etc/nginx/sites-enabled/default
RUN echo '[program:code-server]\n\
command=code-server --auth none --host 0.0.0.0\n\
autostart=true\n\
autorestart=true'\
>> /etc/supervisor/conf.d/code-server.conf
RUN chmod +x /docker-entrypoint.sh

WORKDIR /var/www/html
ENTRYPOINT "/docker-entrypoint.sh"
