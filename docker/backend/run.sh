if [ -n "$PROJECT_ID" ] && [ -n "$REGION" ]; then
  echo "Using Vertex Client"
  echo "PROJECT_ID: $PROJECT_ID"
  echo "REGION: $REGION"
  exec xvfb-run --auto-servernum python ws_server.py --project-id $PROJECT_ID --region $REGION
elif [ -n "$OPENAI_BASE_URL" ] && [ -n "$MODEL_FILENAME" ]; then
  echo "Using OpenAI Client"
  exec xvfb-run --auto-servernum python ws_server.py --llm-client openai-direct --model-name $MODEL_FILENAME
else
  echo "Using Anthropic Client, reading ANTHROPIC_API_KEY from .env"
  exec xvfb-run --auto-servernum python ws_server.py
fi
