#!/usr/bin/env python3
import os
from huggingface_hub import snapshot_download

# ===== 설정 =====
REPO = "ACE-Step/ACE-Step-v1-3.5B"
TARGET_DIR = "/home/mathai/code/ComfyUI/models/TTS/ACE-Step-v1-3.5B"

def main():
    # ===== 디렉토리 생성 =====
    os.makedirs(TARGET_DIR, exist_ok=True)

    # ===== 다운로드 =====
    snapshot_download(
        repo_id=REPO,
        local_dir=TARGET_DIR,
        local_dir_use_symlinks=False
    )

    print("finish download")
    print(f"dir: {TARGET_DIR}")

if __name__ == "__main__":
    main()