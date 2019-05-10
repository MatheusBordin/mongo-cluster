openssl rand -base64 755 > mongo-keyfile
sudo chmod 400 mongo-keyfile
sudo chown 999:999 mongo-keyfile
mv mongo-keyfile ./roles/mongo/files