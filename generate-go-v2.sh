#!/bin/bash
rm -rf ./generated
mkdir ./generated

protoc --plugin=protoc-gen-go=$(which protoc-gen-go) \
   --plugin=protoc-gen-go-grpc=$(which protoc-gen-go-grpc) \
   --go_out="./generated" \
   --go-grpc_out="./generated" \
   ./protos/**/*.proto
