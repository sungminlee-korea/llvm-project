sudo apt-get update
sudo apt-get install -y python3 python3-pip python3-venv
sudo apt-get install -y lsb-release wget software-properties-common gnupg clang lld
sudo apt-get install -y ccache 
sudo apt-get install -y ninja-build
sudo apt-get install gcc g++ gdb -y
sudo apt-get install make cmake -y

# mlir build 공식가이드 https://mlir.llvm.org/getting_started/
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
   -DLLVM_CCACHE_BUILD=ON\
   -DLLVM_USE_SANITIZER="Address;Undefined"\
   -DMLIR_INCLUDE_INTEGRATION_TESTS=ON
cmake --build . --target check-mlir


# Debug build
# cmake -G Ninja ../llvm \
#    -DLLVM_ENABLE_PROJECTS=mlir \
#    -DLLVM_BUILD_EXAMPLES=ON \
#    -DLLVM_TARGETS_TO_BUILD="Native;NVPTX;AMDGPU" \
#    -DCMAKE_BUILD_TYPE=Debug \
#    -DLLVM_ENABLE_ASSERTIONS=ON \
#    -DCMAKE_C_COMPILER=clang \
#    -DCMAKE_CXX_COMPILER=clang++ \
#    -DLLVM_ENABLE_LLD=ON \
#    -DLLVM_CCACHE_BUILD=ON \
#    -DLLVM_USE_SPLIT_DWARF=ON
# cmake --build . --target check-mlir
