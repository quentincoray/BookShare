class RemoveSellingBookFromBookmateBookCategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookmate_book_categories, :selling_book_id, :string
  end
end
