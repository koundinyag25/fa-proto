#!/bin/bash
rm -rf ./generated
# Define the path to the protoc executable
PROTOC_PATH="/opt/homebrew/bin/protoc" # Adjust this path if needed

# Define paths for output directories
GO_OUT_PATH="./generated/go"
JS_OUT_PATH="./generated/js"

# Define paths to the plugins
GRPC_TOOLS_PLUGIN_PATH="./node_modules/.bin/grpc_tools_node_protoc_plugin"
GRPC_WEB_PLUGIN_PATH="./node_modules/.bin/protoc-gen-grpc-web"

# Define the paths to the proto files
PROTO_DIR="protos"

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

# Function to generate JavaScript code for gRPC-Web
generate_js_code() {
  local proto_file="$1"
  local proto_dir="$(dirname "${proto_file}")"
  
  # Create JavaScript output directories
  create_directories "${JS_OUT_PATH}" "${proto_dir}"
  
  echo "Processing ${proto_file}..."

  # Generate JavaScript code
  echo "Generating JavaScript code for ${proto_file}..."
  ${PROTOC_PATH} --js_out=import_style=commonjs:"${JS_OUT_PATH}/${proto_dir}" \
      --grpc-web_out=import_style=commonjs,mode=grpcwebtext:"${JS_OUT_PATH}/${proto_dir}" \
      --plugin=protoc-gen-grpc-web=${GRPC_WEB_PLUGIN_PATH} \
      "${proto_file}"

  # Check for errors in JavaScript code generation
  if [ $? -ne 0 ]; then
    echo "Error generating JavaScript code for ${proto_file}"
  fi
}

# Ensure dependencies are installed
# Uncomment if needed
# npm install grpc-tools grpc-tools-node-protoc protoc-gen-grpc-web

# Debug: Print paths
echo "Using protoc at: ${PROTOC_PATH}"
echo "Using grpc_tools_node_protoc_plugin at: ${GRPC_TOOLS_PLUGIN_PATH}"
echo "Using grpc-web plugin at: ${GRPC_WEB_PLUGIN_PATH}"

# Find all .proto files and generate Go and JavaScript code for each
find ${PROTO_DIR} -name "*.proto" | while read -r proto_file; do
  echo "Found proto file: ${proto_file}"
  generate_go_code "${proto_file}"
  generate_js_code "${proto_file}"
done

echo "Code generation complete!"
