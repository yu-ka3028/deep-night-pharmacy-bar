# 今夜の肴（ランダム出題 + 入力フォーム）

## やったこと

- `TopicsController#show` でランダムにお題を1件取得
- お題表示ビュー（カテゴリ・名前・ルール・問いの構造）
- 自由入力フォームを作成し、`PrescriptionsController#create` へ POST
- `PrescriptionsController` は issue #4 で Claude API 連携するためスタブのみ実装

## 学んだこと

### RANDOM() でランダム取得
```ruby
Topic.order("RANDOM()").first
```
PostgreSQL では `ORDER BY RANDOM()` でランダムソート。小規模データならこれで十分。
大規模になると全件ソートになるので、その場合は `OFFSET` + `COUNT` の方が効率的。

### form_with の hidden_field でお題IDを引き回す
フォーム送信時にどのお題に対する回答かを識別するため、`hidden_field` で `topic_id` を埋め込む。
`prescriptions#create` で `params[:topic_id]` として受け取る。

### ルーティング設計
- `root "topics#show"` → トップページがそのままお題表示
- `resources :prescriptions, only: [:create, :show]` → 送信先と結果表示のみ
- シンプルな一方向フローになっている
