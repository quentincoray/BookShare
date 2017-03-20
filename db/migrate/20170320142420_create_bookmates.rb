class CreateBookmates < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmates do |t|
      t.text :description
      t.string :book_category
      t.boolean :deliver_by_hand
      t.boolean :home_delivery
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
