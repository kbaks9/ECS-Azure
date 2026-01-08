# Stage 1: Build dependencies
FROM python:3.12-alpine AS build
WORKDIR /app

# Install build dependencies
RUN apk add --no-cache build-base libffi-dev musl-dev linux-headers

# Copy only requirements first (cache layer)
COPY app/requirements.txt .

# Install packages into a virtual environment
RUN python -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install --no-cache-dir -r requirements.txt

# Stage 2: Final image
FROM python:3.12-alpine
WORKDIR /app

# Copy virtual environment from build stage
COPY --from=build /opt/venv /opt/venv

# Copy application code
COPY app/ ./app

# Set PATH to use the virtualenv by default
ENV PATH="/opt/venv/bin:$PATH"

EXPOSE 8080
CMD ["python", "app/app.py"]
