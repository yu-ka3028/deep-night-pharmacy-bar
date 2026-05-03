# シェア機能（Xシェア + 静的OGP）

## 実装内容

### Xシェアボタン
- 服薬指導箋・副作用レポートの結果ページ末尾に「Xでシェア」ボタンを追加
- `https://twitter.com/intent/tweet?text=...&url=...` 形式のリンク
- テキストは `ERB::Util.url_encode` でエンコード（XSS対策・文字化け防止）

### OGPメタタグ
- `application.html.erb` の `<head>` に共通OGPタグを配置
- `og:title` / `og:description` はコントローラのインスタンス変数で動的に差し込む

| ページ | og:title | og:description |
|---|---|---|
| 服薬指導箋 | 「{topic.name}」への服薬指導箋 | ai_response の冒頭100文字 |
| 副作用レポート | 副作用レポート | ai_response の冒頭100文字 |
| その他 | 深夜薬局 Bar | デフォルト説明文 |

- `og:image` → 静的画像 `/ogp.png`（`public/ogp.png` に配置が必要）
- `og:url` → `request.url`（Rails の request オブジェクトから取得）
- `twitter:card` → `summary_large_image`

### OGP画像
- `public/ogp.png` を手動で用意する必要がある
- Twitter/X 推奨サイズ: 1200×630px
- ファイルを置くだけで `/ogp.png` として配信される（`RAILS_SERVE_STATIC_FILES=true` が render.yaml で設定済み）

## 変更ファイル

- `app/views/layouts/application.html.erb` — OGPタグ追加・titleを動的化
- `app/controllers/prescriptions_controller.rb` — `@og_title`, `@og_description` セット
- `app/controllers/side_effect_reports_controller.rb` — 同上
- `app/views/prescriptions/show.html.erb` — Xシェアボタン追加
- `app/views/side_effect_reports/show.html.erb` — Xシェアボタン追加
- `app/assets/stylesheets/application.css` — `.btn-share-x`, `.x-icon` スタイル追加
