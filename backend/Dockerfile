FROM maven:3.8.3-openjdk-16

ARG APP_VERSION=1.0.0-def

COPY ./src /backend/src
COPY *.xml /backend/

WORKDIR /backend

# запуск сборки кода
RUN mvn package -Dversion.application=$APP_VERSION

# создание директории, в которую копируются артефакты. Это нужно для организации удобной структуры архива
RUN mkdir /backend/sausage-store

# копирование собранного бэкенда
RUN mv /backend/target/sausage-store-$APP_VERSION.jar /backend/sausage-store/sausage-store-$APP_VERSION.jar

RUN printf "java -jar /backend/sausage-store/sausage-store-${APP_VERSION}.jar \
            --spring.datasource.url=jdbc:postgresql://c-c9qe9747e5iuq9h12lg9.rw.mdb.yandexcloud.net:6432/sausage \
            --spring.datasource.username=sausage \
            --spring.datasource.password=your_password \
            --spring.data.mongodb.uri=mongodb://sausage:your_password@rc1a-yyq5hcvv7rfjmbaz.mdb.yandexcloud.net:27018/sausage?tls=true" \
            > /backend/sausage-store/run_script.sh && chmod +x /backend/sausage-store/run_script.sh

ENTRYPOINT /backend/sausage-store/run_script.sh

# docker build --build-arg APP_VERSION=1.0.0-def -t sausage-store-backend:latest .
# docker run sausage-store-backend