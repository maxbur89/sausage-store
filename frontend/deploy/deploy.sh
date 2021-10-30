#!/bin/bash

# чтобы скрипт завершался, если есть ошибки
set -xe

# Установка npm итд
sudo apt update
sudo apt install -y mc joe npm nodejs net-tools

# Удаляем старую версию
sudo rm -f /home/${DEV_USER}/sausage-store-frontend.tar.gz
sudo rmdir --ignore-fail-on-non-empty /var/www-data/frontend||true

# Установка артефакта
sudo mkdir /var/www-data/||true
sudo mkdir /var/www-data/frontend||true

# Скачиваем артефакт
sudo curl -u ${NEXUS_REPO_USER}:${NEXUS_REPO_PASS} -o /home/${DEV_USER}/sausage-store-frontend.tar.gz \
        ${NEXUS_REPO_URL}/sausage-store-frontend-burunov-m/sausage-store/${VERSION}/sausage-store-frontend-${VERSION}.tar.gz

sudo tar -xvzf /home/${DEV_USER}/sausage-store-frontend.tar.gz -C /var/www-data/frontend/
sudo mv /var/www-data/frontend/sausage-store-${VERSION}/public_html/* /var/www-data/frontend/
sudo rmdir /var/www-data/frontend/sausage-store-${VERSION}/public_html/
sudo rmdir /var/www-data/frontend/sausage-store-${VERSION}/

cd /var/www-data/frontend/
#sudo npm install
#sudo npm run build
sudo npm install -g http-server

# Установка и запуск sausage-store
sudo cp -rf /home/${DEV_USER}/sausage-store-frontend.service /etc/systemd/system/sausage-store-frontend.service
sudo systemctl daemon-reload
sudo systemctl restart sausage-store-frontend
