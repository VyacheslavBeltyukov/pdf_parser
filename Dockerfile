FROM python:3.12.3

WORKDIR /app

# Копіюємо файли з локального репозиторію в контейнер
COPY . /app

# Встановлення залежностей з requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо .env файл в контейнер
COPY .env /app/.env

# Встановлення змінних середовища для шляхи моделей
ENV UPLOAD_DIR=/app/materials/pdf
ENV RESULT_DIR=/app/materials/txt

# Відкриття порту, на якому працюватиме FastAPI
EXPOSE 8080

# Команда для запуску FastAPI за допомогою uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]