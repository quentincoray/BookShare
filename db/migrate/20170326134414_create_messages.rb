class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :user, index: true, foreign_key: true
      t.references :conversation, index: true, foreign_key: true
      t.string :content

      t.timestamps null: false
    end
  end
end
