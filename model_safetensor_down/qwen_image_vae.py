from huggingface_hub import hf_hub_download
import shutil
import os

repo_id = "Comfy-Org/Qwen-Image_ComfyUI"
filename = "split_files/vae/qwen_image_vae.safetensors"
local_dir="/home/mathai/code/ComfyUI/models/vae/"

local_path = hf_hub_download(
    repo_id=repo_id, 
    filename=filename,
    local_dir=local_dir,
    local_dir_use_symlinks=False
)

basename = os.path.basename(filename)

print(f"SafeTensors file downloaded to: {local_path}")

# 3) 최종적으로 원하는 위치 = local_dir/<파일명>
target_path = os.path.join(local_dir, basename)

# 4) 만약 구조가 포함된 경로로 저장되었으면 파일만 복사
if local_path != target_path:
    shutil.copy2(local_path, target_path)
    os.remove(local_path)

    dir_path = os.path.dirname(local_path)
    while dir_path.startswith(local_dir) and dir_path != local_dir:
        try:
            os.rmdir(dir_path)  # 빈 디렉토리만 삭제됨
        except OSError:
            break  # 비어있지 않으면 즉시 종료
        dir_path = os.path.dirname(dir_path)

print("최종 저장 경로:", target_path)