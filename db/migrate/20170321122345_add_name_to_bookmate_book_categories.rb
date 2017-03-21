class AddNameToBookmateBookCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :bookmate_book_categories, :name, :string
  end
end
