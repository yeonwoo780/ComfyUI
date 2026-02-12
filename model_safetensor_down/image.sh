#!/usr/bin/env bash
set -Eeuo pipefail

#######################################
# 경로 계산 (어디서 실행해도 OK)
#######################################
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
IMAGE_DIR="${SCRIPT_DIR}/image"
ENV_FILE="${PROJECT_ROOT}/.env"
LOG_FILE="${PROJECT_ROOT}/image_download.log"

#######################################
# .env 로드
#######################################
if [ ! -f "${ENV_FILE}" ]; then
  echo "❌ .env 파일이 없습니다: ${ENV_FILE}"
  exit 1
fi

set -a
source "${ENV_FILE}"
set +a

if [ -z "${HF_TOKEN:-}" ]; then
  echo "❌ HF_TOKEN 이 .env 에 정의되어 있지 않습니다."
  exit 1
fi

#######################################
# wget 공통 옵션
#######################################
WGET_OPTS=(
  --content-disposition
  --continue
  --tries=3
  --timeout=30
  --header="Authorization: Bearer ${HF_TOKEN}"
)

#######################################
# 실행할 스크립트 목록
#######################################
SCRIPTS=(
  "Qwen-Image-Edit-2509-MathAI-KDrawing-v02.sh"
  "qwen_2.5_vl_7b.sh"
  "qwen_image_edit_2509_bf16.sh"
  "qwen_image_lightning.sh"
  "qwen_image_bf16.sh"
  "qwen_image_edit_2509_lightning.sh"
  "qwen_image_vae.sh"
  "Qwen-Image-MathAI-Korean-Drawing-v0.2.1.sh"
)

#######################################
# 실행
#######################################
echo "🚀 Image safetensor 다운로드 시작"
echo "📄 로그: ${LOG_FILE}"
echo "------------------------------------" | tee -a "${LOG_FILE}"

for script in "${SCRIPTS[@]}"; do
  SCRIPT_PATH="${IMAGE_DIR}/${script}"

  if [ ! -f "${SCRIPT_PATH}" ]; then
    echo "⚠ 스크립트 없음: ${SCRIPT_PATH}" | tee -a "${LOG_FILE}"
    continue
  fi

  if [ ! -x "${SCRIPT_PATH}" ]; then
    chmod +x "${SCRIPT_PATH}"
  fi

  echo "▶ 실행: ${script}" | tee -a "${LOG_FILE}"

  if bash "${SCRIPT_PATH}" >> "${LOG_FILE}" 2>&1; then
    echo "✅ 완료: ${script}" | tee -a "${LOG_FILE}"
  else
    echo "❌ 실패: ${script} (계속 진행)" | tee -a "${LOG_FILE}"
  fi

  echo "------------------------------------" | tee -a "${LOG_FILE}"
done

echo "🎉 모든 image 스크립트 처리 완료"