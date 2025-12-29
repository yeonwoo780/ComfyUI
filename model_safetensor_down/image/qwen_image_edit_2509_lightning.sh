#!/usr/bin/env bash
set -e

# ===== 설정 =====
REPO="lightx2v/Qwen-Image-Lightning"
FILE_PATH="Qwen-Image-Edit-2509/Qwen-Image-Edit-2509-Lightning-4steps-V1.0-bf16.safetensors"
TARGET_DIR="/home/mathai/code/ComfyUI/models/loras/"

URL="https://huggingface.co/${REPO}/resolve/main/${FILE_PATH}"

# ===== 디렉토리 생성 =====
mkdir -p "${TARGET_DIR}"

# ===== 다운로드 =====
wget \
  --content-disposition \
  -P "${TARGET_DIR}" \
  "${URL}"

echo "finish download"
echo "dir: ${TARGET_DIR}/$(basename ${FILE_PATH})"