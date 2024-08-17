#!/bin/bash
rm -rf ./generated
mkdir ./generated

protoc --plugin=protoc-gen-go=$(which protoc-gen-go) \
   --plugin=protoc-gen-go-grpc=$(which protoc-gen-go-grpc) \
   --go_out="." \
   --go-grpc_out="." \
   ./protos/**/*.proto
