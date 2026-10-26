FROM python:3.12-slim

WORKDIR /app

COPY . .
RUN pip install -r requirements.txt

EXPOSE 8004
RUN useradd -m appuser
USER appuser
CMD ["python", "app.py"]
