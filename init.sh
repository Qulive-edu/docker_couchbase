#!/bin/bash

# Ожидание запуска Couchbase
sleep 20

# Настройка кластера
curl -v -X POST http://127.0.0.1:8091/pools/default \
    -u $CB_USERNAME:$CB_PASSWORD \
    -d memoryQuota=512 \
    -d indexMemoryQuota=256

# Создание Bucket
curl -v -X POST http://127.0.0.1:8091/pools/default/buckets \
    -u $CB_USERNAME:$CB_PASSWORD \
    -d name=demo_bucket \
    -d bucketType=couchbase \
    -d ramQuotaMB=100

echo "Couchbase up"
