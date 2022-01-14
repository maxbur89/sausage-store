#!/bin/bash

# чтобы скрипт завершался, если есть ошибки
set -xe

# Скачиваем артефакт
sudo docker login -u ${REGISTRY_USER} -p ${REGISTRY_ACCESS_TOKEN} https://gitlab.praktikum-services.ru:5050/
sudo docker-compose --project-directory /home/admin/ pull

# Установка и запуск sausage-store
sudo cp -rf /home/${DEV_USER}/sausage-store.service /etc/systemd/system/sausage-store.service
sudo systemctl daemon-reload
sudo systemctl restart sausage-store

