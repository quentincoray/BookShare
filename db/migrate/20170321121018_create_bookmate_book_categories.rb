class CreateBookmateBookCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmate_book_categories do |t|
      t.references :selling_book, foreign_key: true
      t.references :bookmate, foreign_key: true

      t.timestamps
    end
  end
end
