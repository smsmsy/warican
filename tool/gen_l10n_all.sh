#!/bin/zsh
set -e

echo "=== CSV → arb 変換 ==="
dart run tool/csv_to_arb.dart

echo "=== arb → Dart コード生成 ==="
flutter gen-l10n

echo "=== 完了 ==="
