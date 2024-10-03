# Stage 1: Build ollama service
FROM ollama/ollama:latest AS ollama

# Stage 2: Build ollama-webui service and copy everything from ollama
FROM ghcr.io/open-webui/open-webui:latest

COPY --from=ollama / /

RUN apt-get update && apt-get install -y git

WORKDIR /app/backend

COPY start.sh ./
RUN chmod +x start.sh

CMD ["./start.sh"]
