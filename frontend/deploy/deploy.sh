#!/bin/bash

# чтобы скрипт завершался, если есть ошибки
set -xe

# Скачиваем артефакт
sudo docker-compose --project-directory /home/admin/ pull

# Установка и запуск sausage-store
sudo cp -rf /home/${DEV_USER}/sausage-store.service /etc/systemd/system/sausage-store.service
sudo systemctl daemon-reload
sudo systemctl restart sausage-store

sudo echo ${VERSION} >> /home/${DEV_USER}/version_frontend_history
