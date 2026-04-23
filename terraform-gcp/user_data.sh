#!/bin/bash
set -e

# Install Docker
apt-get update -y
apt-get install -y docker.io
systemctl enable docker
systemctl start docker

# Run vLLM with the Gemma model on CPU
docker run -d \
  --restart unless-stopped \
  -p 8000:8000 \
  -e HUGGING_FACE_HUB_TOKEN="${hf_token}" \
  vllm/vllm-openai:latest \
  --model "${model_id}" \
  --device cpu \
  --dtype float32 \
  --max-model-len 4096
