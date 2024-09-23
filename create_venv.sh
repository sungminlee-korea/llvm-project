#!/bin/bash

# # venv 디렉토리 생성
python3 -m venv venv

# 가상 환경 활성화
source venv/bin/activate

# pip 업그레이드
python3 -m pip install --upgrade pip

python3 -m pip install -r mlir/python/requirements.txt

echo "가상 환경이 생성되었습니다. 'source venv/bin/activate'로 활성화하세요."

