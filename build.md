# 도커 빌드
```
docker build -f dockerfile -t mlir_docker:v1.0 .
```
# 도커실행 (w/ args)
```
docker run -d -t --name mlir_container -v $(pwd):/workspace --gpus all mlir_docker:v1.0
```
```
vscode 연결 or
docker exec -it mlir_container /bin/bash
```
# mlir build
- [공식가이드](https://mlir.llvm.org/getting_started/)

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
   -DLLVM_CCACHE_BUILD=ON

cmake --build . --target check-mlir
```

# Debug build
```
cmake -G Ninja ../llvm \
   -DLLVM_ENABLE_PROJECTS=mlir \
   -DLLVM_BUILD_EXAMPLES=ON \
   -DLLVM_TARGETS_TO_BUILD="Native;NVPTX;AMDGPU" \
   -DCMAKE_BUILD_TYPE=Debug \
   -DLLVM_ENABLE_ASSERTIONS=ON \
   -DCMAKE_C_COMPILER=clang \
   -DCMAKE_CXX_COMPILER=clang++ \
   -DLLVM_ENABLE_LLD=ON \
   -DLLVM_CCACHE_BUILD=ON \
   -DLLVM_USE_SPLIT_DWARF=ON

cmake --build . --target check-mlir
```