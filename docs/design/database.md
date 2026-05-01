# データベース設計

## 方針
- DBはSupabase（PostgreSQL）の無料枠を使用
- 認証なし
- お題データはSupabaseダッシュボードから直接insert（パブリックリポジトリにデータを含めないため）

---

## テーブル定義

### topics（お題）

| カラム | 型 | 説明 |
|---|---|---|
| id | integer | PK |
| name | string | お題の名前（例：コラッツ予想） |
| rule | text | ルール説明（1〜2行） |
| question | string | 問い（一言） |
| category | string | カテゴリ（数学・物理・生物など） |

### prescriptions（服薬指導箋 / 機能①）

| カラム | 型 | 説明 |
|---|---|---|
| id | integer | PK |
| topic_id | integer | FK → topics.id |
| user_input | text | ユーザーの回答 |
| ai_response | text | 服薬指導箋の全文 |
| created_at | datetime | |

### side_effect_reports（副作用レポート / 機能②）

| カラム | 型 | 説明 |
|---|---|---|
| id | integer | PK |
| user_input | text | 今日やったこと |
| ai_response | text | 副作用レポートの全文 |
| created_at | datetime | |

---

## リレーション

```
topics
  └─ has_many :prescriptions

prescriptions
  └─ belongs_to :topic

side_effect_reports
  └─ 独立（リレーションなし）
```

---

## シェア機能
- `/prescriptions/:id` → 服薬指導箋のシェアページ（OGP対応）
- `/side_effect_reports/:id` → 副作用レポートのシェアページ（OGP対応）
