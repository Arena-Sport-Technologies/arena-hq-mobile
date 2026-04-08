#!/usr/bin/env bash
set -euo pipefail

if [[ $# -eq 0 ]]; then
  echo "Error: No environment specified. Use 'dev', 'stg', or 'prod'."
  exit 1
fi

echo "Running iOS build flavour $1"
flutter build ipa --no-codesign --release --flavor $1 
echo "iOS $1 build complete"