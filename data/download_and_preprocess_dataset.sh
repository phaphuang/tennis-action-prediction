#!/usr/bin/env bash

# exit if any command fails
set -e

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 DATASET_NAME" >&2
  exit 1
fi
if [ $1 = "tennis" ]; then
  TARGET_DIR=./data/tennis
  ZIP_NAME=tennis
  unzip ${TARGET_DIR}/raw/${ZIP_FNAME} -d ${TARGET_DIR}/raw/${ACTION}
  python video_prediction/datasets/tennis_dataset.py ${TARGET_DIR}
  rm -rf ${TARGET_DIR}/raw
else
  echo "Invalid dataset name: '$1' (choose from 'tennis')" >&2
  exit 1
fi
echo "Succesfully finished downloading and preprocessing dataset '$1'"