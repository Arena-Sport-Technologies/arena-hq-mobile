#!/usr/bin/env bash
set -euo pipefail

echo "Running quality checks"

fvm dart format --output=none --set-exit-if-changed .
fvm flutter analyze
fvm flutter test --no-pub --coverage 

echo "Quality checks passed"