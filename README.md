# Lesson 6

1. тип базы single
2. hostname rc1b-9ceyxhrz47ayyd9c.mdb.yandexcloud.net
3. порт 6432
4. имя/пароль sausage/your_password
5. база sausage

1. тип базы cluster
2. hostname c-c9qelolihaitopcbigdo.rw.mdb.yandexcloud.net, c-c9qelolihaitopcbigdo.ro.mdb.yandexcloud.net
или rc1a-lv6jh3snk3msxxnz.mdb.yandexcloud.net, rc1b-hgc850hnrl335eqj.mdb.yandexcloud.net
3. порт 6432
4. имя/пароль sausage/your_password
5. база sausage







# Sausage Store

![image](https://user-images.githubusercontent.com/9394918/121517767-69db8a80-c9f8-11eb-835a-e98ca07fd995.png)


## Technologies used

* Frontend – TypeScript, Angular.
* Backend  – Java 16, Spring Boot, Spring Data.
* Database – H2.

## Installation guide
### Backend

Install Java 16 and maven and run:

```bash
cd backend
mvn package
cd target
java -jar sausage-store-0.0.1-SNAPSHOT.jar
```

### Frontend

Install NodeJS and npm on your computer and run:

```bash
cd frontend
npm install
npm run build
npm install -g http-server
sudo http-server ./dist/frontend/ -p 80 --proxy http://localhost:8080
```

Then open your browser and go to [http://localhost](http://localhost)
