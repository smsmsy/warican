// ignore_for_file: avoid_print, document_ignores
/// 文言リソースとしてのcsvファイルをarbファイルに変換するツール
library;

import 'dart:convert';
import 'dart:io';

void main() async {
  final csvFile = File('tool/strings.csv');
  if (!csvFile.existsSync()) {
    print('CSVファイルが見つかりません: tool/strings.csv');
    exit(1);
  }
  final lines = await csvFile.readAsLines();
  if (lines.isEmpty) {
    print('CSVファイルが空です');
    exit(1);
  }

  final headers = lines.first.split(',');
  final langIndices = <String, int>{};
  for (var i = 1; i < headers.length; i++) {
    langIndices[headers[i]] = i;
  }

  final translations = <String, Map<String, String>>{};
  for (final lang in langIndices.keys) {
    translations[lang] = {};
  }

  for (var i = 1; i < lines.length; i++) {
    final cols = lines[i].split(',');
    final key = cols[0];
    for (final lang in langIndices.keys) {
      final idx = langIndices[lang]!;
      if (idx < cols.length) {
        translations[lang]![key] = cols[idx];
      }
    }
  }

  for (final lang in translations.keys) {
    final map = translations[lang]!;
    final arb = const JsonEncoder.withIndent('  ').convert(map);
    final outFile = File('lib/l10n/intl_$lang.arb');
    await outFile.writeAsString(arb);
    print('Generated lib/l10n/intl_$lang.arb');
  }
}
