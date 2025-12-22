# Stage 1: Build dependencies
FROM python:3.12-slim AS build
WORKDIR /app
COPY app/requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

#Stage 2: Final stage
FROM python:3.12-slim
WORKDIR /app
COPY --from=build /install /usr/local
COPY . .
EXPOSE 8080
CMD ["python", "app/app.py"]