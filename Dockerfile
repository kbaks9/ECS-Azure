# Stage 1: Build dependencies
FROM python:3.12-alpine AS build
WORKDIR /app
RUN apk add --no-cache build-base libffi-dev musl-dev linux-headers
COPY app/requirements.txt .
RUN python -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install --no-cache-dir -r requirements.txt
FROM python:3.12-alpine
WORKDIR /app
RUN apk upgrade --no-cache
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
COPY --from=build --chown=appuser:appgroup /opt/venv /opt/venv
COPY --chown=appuser:appgroup app/ ./app
ENV PATH="/opt/venv/bin:$PATH"
USER appuser
EXPOSE 8080
CMD ["python", "app/app.py"]