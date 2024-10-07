
### 컨테이너 생성 (w/ args)
```
docker run -d -t --name mlir_study -v $(pwd):/workspace --gpus all cuda_dafault:v1.0
```
### 컨테이너 실행
```
vscode 연결 or
docker exec -it mlir_study /bin/bash
```