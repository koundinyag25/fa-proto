#!/bin/bash

# Define the path to the protoc executable
PROTOC_PATH="/opt/homebrew/bin/protoc" # Adjust this path if needed

# Define paths for output directory
JS_OUT_PATH="./generated/js"

# Define the path to the grpc_tools_node_protoc_plugin
GRPC_TOOLS_PLUGIN_PATH="./node_modules/.bin/grpc_tools_node_protoc_plugin"

# Define the paths to the proto files
USER_MANAGEMENT_PROTO="user-management/user-management.proto"
ASSET_MANAGEMENT_PROTO="asset-management/asset-management.proto"

# Function to create directories
create_directories() {
  local base_dir="$1"
  mkdir -p "${base_dir}"
}

# Function to generate JavaScript code
generate_code() {
  local proto_file="$1"
  
  # Create JavaScript output directory
  create_directories "${JS_OUT_PATH}"
  
  echo "Processing ${proto_file}..."

  # Generate JavaScript code
  echo "Generating JavaScript code for ${proto_file}..."
  ${PROTOC_PATH} --js_out=import_style=commonjs:"${JS_OUT_PATH}" \
      --grpc_out="${JS_OUT_PATH}" \
      --plugin=protoc-gen-grpc=${GRPC_TOOLS_PLUGIN_PATH} \
      "${proto_file}"

  # Check for errors in JavaScript code generation
  if [ $? -ne 0 ]; then
    echo "Error generating JavaScript code for ${proto_file}"
  fi
}

# Export PATH for protoc plugins
export PATH="$PATH:$(npm bin -g)"

# Debug: Print paths
echo "Using protoc at: ${PROTOC_PATH}"
echo "Using grpc_tools_node_protoc_plugin at: ${GRPC_TOOLS_PLUGIN_PATH}"

# Generate code for each proto file
for proto_file in ${USER_MANAGEMENT_PROTO} ${ASSET_MANAGEMENT_PROTO}; do
  generate_code "${proto_file}"
done

echo "JavaScript code generation complete!"
