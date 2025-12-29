#!/usr/bin/env bash
set -e

# ===== 설정 =====
REPO="Comfy-Org/ACE-Step_ComfyUI_repackaged"
FILE_PATH="all_in_one/ace_step_v1_3.5b.safetensors"
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