FROM ubuntu:22.04

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install gcc g++ gdb -y
RUN apt-get install make cmake -y
RUN apt-get install -y sudo
RUN apt-get install -y git
RUN apt-get install -y vim
RUN apt-get update && \
    apt-get install -y python3 python3-pip
RUN apt-get install -y lsb-release wget software-properties-common gnupg clang lld
# RUN bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
# 일반 사용자 생성 및 비밀번호 설정
RUN useradd -ms /bin/bash lsm0729 && \
    echo 'lsm0729:784613' | chpasswd && \
    usermod -aG sudo lsm0729

# 작업 디렉토리 생성
RUN mkdir -p /workspace && \
    chown -R lsm0729:lsm0729 /workspace

# 사용자 전환 및 작업 디렉토리 설정
USER lsm0729
WORKDIR /workspace

# 파일 복사 (root 권한으로 복사됨)
COPY --chown=lsm0729:lsm0729 . /workspace