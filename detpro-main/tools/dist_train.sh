#!/usr/bin/env bash

CONFIG=$1
GPUS=$2
PORT=${PORT:-29500}

PYTHONPATH="$(dirname $0)/..":$PYTHONPATH \
python -m torch.distributed.launch --nproc_per_node=$GPUS --master_port=$PORT \
    $(dirname "$0")/train.py $CONFIG --launcher pytorch ${@:3}
#$(dirname $0)/... 表示工具的父文件夹，它是 mmclassification 的根目录。
#通过添加这一行，dist_train.sh可以自动在PYTHONPATH中添加mmclassification的根目录，无论你在哪里调用这个脚本。