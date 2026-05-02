# 服薬指導箋 AI 生成（Claude API 連携）

## やったこと

- `prescriptions` テーブルのマイグレーション（UUID PK、topic_id、user_input、ai_response）
- `ClaudeService` を `app/services/` に実装（柴犬薬剤師キャラ + 服薬指導箋フォーマット）
- `PrescriptionsController#create` で ClaudeService を呼び、DB に保存して `show` へリダイレクト
- `prescriptions#show` ビューで服薬指導箋を表示

## 学んだこと

### Rails の Service Object パターン
`app/services/` にビジネスロジックを分離すると、コントローラーが薄くなり責務が明確になる。
Rails はデフォルトで `app/services/` を autoload してくれる（Rails 6以降）。

### Anthropic Ruby SDK の使い方
```ruby
client = Anthropic::Client.new(api_key: ENV["CLAUDE_API_KEY"])
response = client.messages.create(
  model: :"claude-haiku-4-5-20251001",
  max_tokens: 4096,
  system_: [{ type: "text", text: SYSTEM_PROMPT }],
  messages: [{ role: "user", content: prompt }]
)
text = response.content.find { |block| block.type == :text }&.text
```

- `system_` はアンダースコア付き（`Kernel#system` との衝突を避けるため）
- `response.content` は配列なので `type == :text` のブロックを探す
- `.type` はシンボル（`:text`）で比較する

### UUID を PK にするマイグレーション
```ruby
create_table :prescriptions, id: :uuid do |t|
  ...
end
```
Supabase と相性が良く、外部公開URLに連番IDを使わずに済む。

### システムプロンプト設計のポイント
- キャラクター定義・フォーマット・架空の薬の命名ルールを明示すると出力が安定する
- フォーマットを厳密に指定し「前置き不要」と書くことで余計なテキストを減らせる
- ユーザー回答の質（正確 or あいまい）に応じた処方を促すと評価フィードバックになる

### `.env` の重複問題
`CLAUDE_API_KEY` が2重に書かれており認証エラーになっていた。
`rails runner "puts ENV['CLAUDE_API_KEY'].length"` で文字数を確認し発見。
