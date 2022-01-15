FROM maven:3.8.3-openjdk-16 AS builder

ARG APP_VERSION

WORKDIR /backend

COPY ./src /backend/src
COPY *.xml /backend/

# запуск сборки кода
RUN mvn package -Dversion.application=$APP_VERSION

# создание директории, в которую копируются артефакты. Это нужно для организации удобной структуры архива
RUN mkdir /backend/sausage-store




FROM maven:3.8.3-openjdk-16

ARG APP_VERSION

# копирование собранного бэкенда
WORKDIR /backend
RUN mkdir /backend/sausage-store

COPY --from=builder /backend/target/sausage-store-$APP_VERSION.jar /backend/sausage-store/sausage-store-$APP_VERSION.jar
COPY --from=builder /backend/*.xml /backend/
COPY --from=builder /backend/src /backend/src

RUN printf "java -jar /backend/sausage-store/sausage-store-${APP_VERSION}.jar \
            --spring.datasource.url=jdbc:postgresql://c-c9qe9747e5iuq9h12lg9.rw.mdb.yandexcloud.net:6432/sausage \
            --spring.datasource.username=sausage \
            --spring.datasource.password=your_password \
            --spring.data.mongodb.uri=mongodb://sausage:your_password@rc1a-yyq5hcvv7rfjmbaz.mdb.yandexcloud.net:27018/sausage?tls=true" \
            > /backend/sausage-store/run_script.sh && chmod +x /backend/sausage-store/run_script.sh

EXPOSE 8080

RUN groupadd --gid 1002 admin \
    && useradd --uid 1001 --gid 1002 admin

USER admin

ENTRYPOINT /backend/sausage-store/run_script.sh