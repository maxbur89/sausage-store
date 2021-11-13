#!/bin/bash

# чтобы скрипт завершался, если есть ошибки
set -xe

sudo rm -f /home/${DEV_USER}/sausage-store.jar||true

VERSION=`sudo tail -n 2 /home/${DEV_USER}/version_backend_history | sudo head -n 1`

# скачиваем артефакт
curl -u ${NEXUS_REPO_USER}:${NEXUS_REPO_PASS} -o /home/${DEV_USER}/sausage-store.jar \
        ${NEXUS_REPO_URL}/sausage-store-backend-burunov-m/com/yandex/practicum/devops/sausage-store/${VERSION}/sausage-store-${VERSION}.jar

sudo cp -rf /home/${DEV_USER}/sausage-store-backend.service /etc/systemd/system/sausage-store-backend.service

sudo systemctl daemon-reload

sudo systemctl restart sausage-store-backend

sudo echo ${VERSION} >> /home/${DEV_USER}/version_backend_history
