class CreateOrderedBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :ordered_books do |t|
      t.references :order, foreign_key: true
      t.references :selling_book, foreign_key: true

      t.timestamps
    end
  end
end
