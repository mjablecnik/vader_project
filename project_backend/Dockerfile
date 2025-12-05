FROM debian:stable-slim
WORKDIR /app

COPY pubspec.yaml /app/pubspec.yaml
COPY bin/server /app/server

EXPOSE 8000

CMD ["./server"]