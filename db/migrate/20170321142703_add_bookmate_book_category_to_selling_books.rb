class AddBookmateBookCategoryToSellingBooks < ActiveRecord::Migration[5.0]
  def change
    add_reference :selling_books, :bookmate_book_category, index: true
  end
end
