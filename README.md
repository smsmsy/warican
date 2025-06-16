# warican

waricanは割り勘計算をサポートするFlutterアプリです。

## 概要

- Flutter製クロスプラットフォームアプリ
- 多言語対応（日本語・英語）
- 割り勘計算や金額入力をシンプルに行えます

## セットアップ

1. Flutter SDK（3.8.1以上）をインストール
2. このリポジトリをクローン
3. 依存パッケージを取得

```sh
flutter pub get
```

## 開発・ビルド・実行

### 開発サーバ起動

```sh
flutter run
```

### テスト実行

```sh
flutter test
```

### l10n（多言語対応）運用手順

#### 翻訳追加・更新方法

1. `lib/l10n/intl_ja.arb` などのARBファイルを編集し、翻訳を追加・修正します。
2. 下記コマンドでローカライズファイルを自動生成します。

```sh
flutter gen-l10n
```

#### 開発時の注意

- `AppLocalizations.of(context)` を使う場合は、`Builder`や別Widgetでcontextを取得してください。
- `pubspec.yaml` の `flutter:` セクションに `generate: true` が必要です。

#### CI/CDでの自動生成例

CI/CDパイプラインで下記コマンドを実行してください。

```sh
flutter pub get
flutter gen-l10n
```

## ディレクトリ構成
```
lib/
  main.dart                ... エントリポイント
  l10n/                    ... 多言語対応関連ファイル
    intl_ja.arb            ... 日本語翻訳
    intl_en.arb            ... 英語翻訳
    app_localizations.dart ... 自動生成ローカライズクラス
  static/                  ... 全言語共通の定数
    string_data.dart       ... アプリ共通タイトル等
...
test/                      ... テストコード
```

## ライセンス
このプロジェクトはMITライセンスです。
