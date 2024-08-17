#!/bin/bash
rm -rf ./generated
# mkdir generated

protoc --plugin=protoc-gen-go=$(which protoc-gen-go) \
   --go_out="." \
   --go-grpc_out="." \
   ./protos/**/*.proto
#    --go_opt=paths=source_relative \
#    --go-grpc_opt=paths=source_relative 

