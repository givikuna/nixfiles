#!/usr/bin/env bash

set -euo pipefail

for i in {1..30}; do
  if ollama list &>/dev/null; then
    break
  fi
  echo "Waiting for ollama daemon..."
  sleep 1
done

current_models=$(ollama list | tail -n +2 | awk '{print $1}')

desired_models=$(printf '%s\n' $MODELS | sort -u)

if [[ "${REMOVE_EXTRAS:-false}" == "true" ]]; then
  for model in $current_models; do
    if ! echo "$desired_models" | grep -qx "$model"; then
      echo "Removing extra model: $model"
      ollama rm "$model" || true
    fi
  done
fi

for model in $desired_models; do
  if ! echo "$current_models" | grep -qx "$model"; then
    echo "Pulling model: $model"
    ollama pull "$model"
  else
    echo "Model already present: $model"
  fi
done