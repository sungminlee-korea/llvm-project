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
# llvm build
```
mkdir build
cd build

cmake -G Ninja ../llvm \
   -DLLVM_ENABLE_PROJECTS=mlir \
   -DLLVM_BUILD_EXAMPLES=ON \
   -DLLVM_TARGETS_TO_BUILD="Native;NVPTX;AMDGPU" \
   -DCMAKE_BUILD_TYPE=Release \
   -DLLVM_ENABLE_ASSERTIONS=ON \
   -DCMAKE_C_COMPILER=clang \
   -DCMAKE_CXX_COMPILER=clang++ \
   -DLLVM_ENABLE_LLD=ON \
   -DLLVM_CCACHE_BUILD=OFF

# 리빌드시 -DLLVM_CCACHE_BUILD=ON

cmake --build . --target check-mlir
```

# 참고
```
https://mlir.llvm.org/getting_started/
```