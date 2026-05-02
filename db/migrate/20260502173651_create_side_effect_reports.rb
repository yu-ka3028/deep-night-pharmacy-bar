class CreateSideEffectReports < ActiveRecord::Migration[7.0]
  def change
    create_table :side_effect_reports, id: :uuid do |t|
      t.text :user_input, null: false
      t.text :ai_response

      t.timestamps
    end
  end
end
