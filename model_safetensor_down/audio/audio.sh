#!/usr/bin/env bash
set -e

# ===== 설정 =====
REPO="ACE-Step/ACE-Step-v1-3.5B"
TARGET_DIR="/home/mathai/code/ComfyUI/models/TTS/ACE-Step-v1-3.5B"

# ===== 디렉토리 생성 =====
mkdir -p "${TARGET_DIR}"

# ===== 다운로드 =====
huggingface-cli download \
  "${REPO}" \
  --local-dir "${TARGET_DIR}" \
  --local-dir-use-symlinks False

echo "finish download"
echo "dir: ${TARGET_DIR}"