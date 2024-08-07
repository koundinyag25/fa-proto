#!/bin/bash

# Define the path to the protoc executable
PROTOC_PATH="/opt/homebrew/bin/protoc" # Adjust this path if needed

# Define paths for output directories
GO_OUT_PATH="./generated/go"
JS_OUT_PATH="./generated/js"  # Not used anymore

# Define the path to the grpc_tools_node_protoc_plugin
GRPC_TOOLS_PLUGIN_PATH="/Users/koundinya/.nvm/versions/node/v22.5.1/bin/grpc_tools_node_protoc_plugin"  # Not used anymore

# Define the paths to the proto files
USER_MANAGEMENT_PROTO="user-management/user-management.proto"
ASSET_MANAGEMENT_PROTO="asset-management/asset-management.proto"

# Function to create directories
create_directories() {
  local base_dir="$1"
  local proto_dir="$2"
  mkdir -p "${base_dir}/${proto_dir}"
}

# Function to generate Go code
generate_go_code() {
  local proto_file="$1"
  local proto_dir="$(dirname "${proto_file}")"
  
  # Create Go output directories
  create_directories "${GO_OUT_PATH}" "${proto_dir}"
  
  echo "Processing ${proto_file}..."

  # Generate Go code
  echo "Generating Go code for ${proto_file}..."
  ${PROTOC_PATH} --plugin=protoc-gen-go=$(which protoc-gen-go) \
      --go_out="${GO_OUT_PATH}/${proto_dir}" \
      --go-grpc_out="${GO_OUT_PATH}/${proto_dir}" \
      --go_opt=paths=source_relative \
      --go-grpc_opt=paths=source_relative \
      "${proto_file}"

  # Check for errors in Go code generation
  if [ $? -ne 0 ]; then
    echo "Error generating Go code for ${proto_file}"
  fi
}

# Ensure dependencies are installed
# npm install grpc-tools grpc-tools-node-protoc

# Debug: Print paths
echo "Using protoc at: ${PROTOC_PATH}"

# Find all .proto files and generate Go code for each
find . -name "*.proto" | while read -r proto_file; do
  echo "Found proto file: ${proto_file}"
  generate_go_code "${proto_file}"
done

echo "Code generation complete!"
