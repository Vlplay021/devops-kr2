FROM python:3.12-slim
WORKDIR /app

# 1. Сначала копируем только зависимости
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 2. Потом копируем всё остальное
COPY . .

EXPOSE 8004
RUN useradd -m appuser
USER appuser

CMD ["flask", "--app", "app", "run", "--host=0.0.0.0", "--port=8004"]