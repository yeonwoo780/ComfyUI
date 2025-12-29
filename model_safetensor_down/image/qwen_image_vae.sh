#!/usr/bin/env bash
set -e

# ===== 설정 =====
REPO="Comfy-Org/Qwen-Image_ComfyUI"
FILE_PATH="split_files/vae/qwen_image_vae.safetensors"
TARGET_DIR="/home/mathai/code/ComfyUI/models/vae/"

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