class CreatePrescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :prescriptions, id: :uuid do |t|
      t.integer :topic_id, null: false
      t.text :user_input, null: false
      t.text :ai_response

      t.timestamps
    end
  end
end
