ARG BUILD_FROM
FROM $BUILD_FROM

# Установка Node.js
RUN apk add --no-cache nodejs npm

# Создание рабочей директории
WORKDIR /app

# Копирование зависимостей
COPY package.json .
COPY package-lock.json .

# Установка зависимостей
RUN npm install --production

# Копирование приложения
COPY server.js .

# Определение команды для запуска приложения
CMD [ "node", "server.js" ]
