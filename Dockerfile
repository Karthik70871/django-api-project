# syntax=docker/dockerfile:1.4
FROM python:3.10-alpine

WORKDIR /app
EXPOSE 8000

# Install dependencies
RUN apk update && apk add --no-cache \
    pkgconfig \
    gcc \
    musl-dev \
    bash \
    mariadb-dev

# Copy requirements and install Python deps
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy rest of the code
COPY . .

# Default command
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
