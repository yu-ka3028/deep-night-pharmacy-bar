client = Anthropic::Client.new(api_key: ENV["CLAUDE_API_KEY"])

HINT_PROMPT = <<~PROMPT
  あなたはクイズの前提知識を書くライターです。
  お題の名前・カテゴリ・ルール・問いを受け取り、答えを考えるための「とっかかり」となる前提知識を書いてください。

  ## ルール
  - 2〜3文、合計100文字以内
  - 答えそのものは書かない
  - 専門用語が出る場合は一言補足する
  - 「〜です」調で書く
  - フォーマットはテキストのみ（箇条書き・記号不要）
PROMPT

Topic.find_each do |topic|
  next if topic.hint.present?

  user_content = <<~TEXT
    カテゴリ：#{topic.category}
    お題：#{topic.name}
    ルール：#{topic.rule}
    問い：#{topic.question}
  TEXT

  response = client.messages.create(
    model: :"claude-haiku-4-5-20251001",
    max_tokens: 256,
    system_: [{ type: "text", text: HINT_PROMPT }],
    messages: [{ role: "user", content: user_content }]
  )

  hint = response.content.find { |block| block.type == :text }&.text&.strip
  topic.update!(hint: hint)
  puts "✓ [#{topic.id}] #{topic.name}\n  → #{hint}\n"
end

puts "\n完了: #{Topic.where.not(hint: nil).count}/#{Topic.count} 件"
