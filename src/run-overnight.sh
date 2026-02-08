#!/bin/bash
# Full benchmark run for Result (final) graphs
# Skips: google-protobuf, @bufbuild/protobuf, avro-js (excluded from final results)
# Skips: optional/unmapped variants (Result extra, run separately if needed)
# Skips: testBsonUnmapped (crashes with current bson version)
#
# Estimated time: ~2-3 hours at MAX_SIZE_IN_MB=299

cd "$(dirname "$0")"

NODE="node --expose-gc --max-old-space-size=4096 -r ts-node/register"

# Reset previous data
rm -f tmp/plot.json

echo "=== Starting full benchmark run at $(date) ==="

run_test() {
  echo ""
  echo "--- $1 starting at $(date) ---"
  if $NODE index.ts -- "$1"; then
    echo "--- $1 completed at $(date) ---"
  else
    echo "--- $1 FAILED (exit code $?) at $(date) --- continuing..."
  fi
}

run_test testJson
run_test testAvroAvsc
run_test testJsBin
run_test testProtoJs
run_test testProtoPbf
run_test testBser
run_test testBson
run_test testV8
run_test testMsgpack
run_test testCbor

echo ""
echo "=== Benchmark complete at $(date) ==="
echo "Results saved to tmp/plot.json"
echo "Run 'python plot.py' to generate graphs"
