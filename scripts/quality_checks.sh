#!/usr/bin/env bash
set -euo pipefail

echo "Running quality checks"

echo "Running dart format"
dart format --output=none --set-exit-if-changed .

echo "Running flutter analyze"
flutter analyze

echo "Running flutter test"
flutter test --no-pub --coverage 

echo "Quality checks passed"