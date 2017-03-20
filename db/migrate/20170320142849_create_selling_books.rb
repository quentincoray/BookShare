class CreateSellingBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :selling_books do |t|
      t.references :bookmate, foreign_key: true
      t.references :book, foreign_key: true
      t.text :personalized_comment
      t.float :price
      t.string :condition
      t.boolean :favorite_book
      t.boolean :sold

      t.timestamps
    end
  end
end
