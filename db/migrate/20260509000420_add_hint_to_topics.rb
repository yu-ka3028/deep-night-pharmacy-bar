class AddHintToTopics < ActiveRecord::Migration[7.0]
  def change
    add_column :topics, :hint, :text
  end
end
