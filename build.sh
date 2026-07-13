#!/usr/bin/env bash

# Check if an argument was provided
if [ -z "$1" ]; then
    echo "❌ Error: Please provide a model config name."
    echo "Usage: ./build.sh gemma4-4b-mini-pc"
    exit 1
fi

MODEL_NAME=$1
BASE_CONFIG="models/${MODEL_NAME}.Modelfile"
FINAL_CONFIG="dist/socratic_tutor_${MODEL_NAME}.Modelfile"

# Check if the base configuration file actually exists
if [ ! -f "$BASE_CONFIG" ]; then
    echo "❌ Error: Configuration file '$BASE_CONFIG' not found."
    exit 1
fi

# Ensure the dist/ directory exists
mkdir -p dist

# Combine the base config and the system prompt into the dist directory
cat "$BASE_CONFIG" <(echo -e "\n\"\"\"") system_prompt.md <(echo "\"\"\"") > "$FINAL_CONFIG"

echo "💾 Created compiled Modelfile: $FINAL_CONFIG"

# Optional Ollama Compilation Step
echo -n "🤖 Would you like to create/update this model in Ollama now? (y/N): "
read -r RESPONSE

if [[ "$RESPONSE" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    echo "🔨 Compiling into Ollama as 'socratic-${MODEL_NAME}'..."
    ollama create "socratic-${MODEL_NAME}" -f "$FINAL_CONFIG"
    echo "✅ Success! Model 'socratic-tutor-${MODEL_NAME}' is ready to use."
else
    echo "👍 Skipped Ollama creation. You can find your deployment file at '$FINAL_CONFIG'."
fi