FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

COPY backend/requirements-demo.txt /app/backend/requirements-demo.txt
RUN pip install --no-cache-dir -r /app/backend/requirements-demo.txt

COPY backend /app/backend
COPY frontend /app/frontend

WORKDIR /app/backend

CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port ${PORT:-10000} --workers 1"]
