class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.integer :user1_id, index: true, foreign_key: true
      t.integer :user2_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
