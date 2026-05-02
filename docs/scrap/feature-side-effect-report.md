# 今日の副作用レポート実装メモ（issue #5）

## 追加したもの

- `SideEffectReport` モデル・マイグレーション（UUID PK）
- `SideEffectsController`（new / create）
- `SideEffectReportsController`（show）
- `ClaudeService#generate_side_effect_report`（専用プロンプト）
- ビュー2枚：入力フォーム・結果表示

## ClaudeService の設計メモ

`SIDE_EFFECT_SYSTEM_PROMPT` を既存の `SYSTEM_PROMPT` とは別定数で定義。
服薬指導箋とは別の世界観（添付文書風）なので、プロンプトを混ぜないほうがトーンが安定しやすい。

出力フォーマット：
- 今日の活動成分
- 効能・効果
- 副作用
- 今夜の処方（実在するお酒を具体的に）

## ルーティング

既に `config/routes.rb` に記載済みだったのでそのまま流用。
