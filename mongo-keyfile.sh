openssl rand -base64 755 > mongo-keyfile
chmod 400 mongo-keyfile
chown 999:999 mongo-keyfile