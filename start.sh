#!/usr/bin/env bash

mkdir -p /app/backend/data/models

/bin/ollama serve &

# Wait until Ollama service is up and running
until curl -s http://localhost:11434 > /dev/null; do 
  echo 'Waiting for Ollama service to start...'; 
  sleep 1; 
done 

if ! [ -e "$DEFAULT_MODEL" ]; then
  echo "Pulling default model: $DEFAULT_MODEL"
  ollama pull $DEFAULT_MODEL &
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR" || exit

KEY_FILE=.webui_secret_key

PORT="${PORT:-8080}"
if test "$WEBUI_SECRET_KEY $WEBUI_JWT_SECRET_KEY" = " "; then
  echo No WEBUI_SECRET_KEY provided

  if ! [ -e "$KEY_FILE" ]; then
    echo Generating WEBUI_SECRET_KEY
    # Generate a random value to use as a WEBUI_SECRET_KEY in case the user didn't provide one.
    echo $(head -c 12 /dev/random | base64) > $KEY_FILE
  fi

  echo Loading WEBUI_SECRET_KEY from $KEY_FILE
  WEBUI_SECRET_KEY=`cat $KEY_FILE`
fi

WEBUI_SECRET_KEY="$WEBUI_SECRET_KEY" exec uvicorn open_webui.main:app --host 0.0.0.0 --port 8080 --forwarded-allow-ips '*'
