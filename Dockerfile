# Используем официальный образ Couchbase
FROM couchbase:latest

# Устанавливаем переменные окружения для начальной настройки
ENV CB_USERNAME=admin \
    CB_PASSWORD=password

# Копируем скрипт начальной настройки (опционально, если требуется автоматизация)
COPY init.sh /init.sh
RUN chmod +x /init.sh

# Указываем рабочую директорию (опционально)
WORKDIR /opt/couchbase

# Открываем необходимые порты
EXPOSE 8091 8092 8093 11210 11211

# Выполняем команду запуска Couchbase
CMD ["couchbase-server"]
