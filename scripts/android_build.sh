#!/usr/bin/env bash
set -euo pipefail

if [[ $# -eq 0 ]]; then
  echo "Error: No environment specified. Use 'dev', 'stg', or 'prod'."
  exit 1
fi

echo "Running Android build flavour $1"
flutter build appbundle --release --flavor $1
echo "Android $1 build complete"