# 도커 빌드
```docker build -f dockerfile -t llvm_docker:v1.0 .```
# 도커실행 (w/ args)
```
docker run -d -t --name llvm_container -v $(pwd):/workspace --gpus all llvm_docker:v1.0
```
```
vscode 연결 or
docker exec -it llvm_container /bin/bash
```
