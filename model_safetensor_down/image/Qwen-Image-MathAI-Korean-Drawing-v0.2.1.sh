#!/usr/bin/env bash
set -e

REPO="MathAI-Company/Qwen-Image-MathAI-Korean-Drawing-v02"
FILE_PATH="Qwen-Image-MathAI-KDrawing-V0.2.1.safetensors"
TARGET_DIR="/home/mathai/code/ComfyUI/models/loras/"

URL="https://huggingface.co/${REPO}/resolve/main/${FILE_PATH}"

mkdir -p "${TARGET_DIR}"

wget \
  --header="Authorization: Bearer ${HF_TOKEN}" \
  --content-disposition \
  -P "${TARGET_DIR}" \
  "${URL}"

echo "✅ 다운로드 완료"