# Stage 1: install dependencies
FROM python:3.11-slim AS build

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# system deps (if needed)
RUN apt-get update && apt-get install -y build-essential curl --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# copy only requirements first (cache layer)
COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: copy app and run
FROM python:3.11-slim

WORKDIR /app

# copy installed packages from build stage
COPY --from=build /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY --from=build /usr/local/bin /usr/local/bin

# copy app files
COPY . .

# create a user for safety (avoid root)
RUN groupadd -r app && useradd -r -g app app \
    && chown -R app:app /app

USER app

EXPOSE 8000

# Recommended entry using uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--workers", "1"]
