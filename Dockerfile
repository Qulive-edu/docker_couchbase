# Используем официальный образ Python
FROM python:3.9
COPY . /app
# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файлы проекта в контейнер


# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Открываем порт
EXPOSE 5000

# Запускаем приложение
CMD ["python", "run.py"]
