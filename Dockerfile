# Stage 1: Build ollama service
FROM ollama/ollama:latest AS ollama

# Stage 2: Build ollama-webui service and copy everything from ollama
FROM ghcr.io/ollama-webui/ollama-webui:main
COPY --from=ollama / /

WORKDIR /app/backend

COPY start.sh ./
RUN chmod +x start.sh

CMD ["./start.sh"]
