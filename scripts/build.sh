#!/usr/bin/env bash
set -euo pipefail

if [[ $# -eq 0 ]]; then
  echo "Error: No environment specified. Use 'dev', 'stg', or 'prod'."
  exit 1
fi

./android_build.sh $1 &
pids+=($!)
./ios_build.sh $1 &
pids+=($!)

for pid in "${pids[@]}"; do
    wait "${pid}"
    status+=($?)
done

exit_code=0

for i in "${!status[@]}"; do
    echo "Job $i exited with ${status[$i]}"
    if [[ status[$i] != 0 ]]; then
        exit_code="${status[$i]}"
    fi
done

if [[ exit_code -ne 0 ]]; then
echo "Builds completed with errors! ${exit_code}"
exit "${exit_code}"
fi

echo "All builds completed successfully."