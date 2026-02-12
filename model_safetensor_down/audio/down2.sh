#!/usr/bin/env bash
set -e

# ===== 설정 =====
REPO="Comfy-Org/ace_step_1.5_ComfyUI_files"
FILE_PATH="checkpoints/ace_step_1.5_turbo_aio.safetensors"
TARGET_DIR="/home/mathai/code/ComfyUI/models/checkpoints"

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