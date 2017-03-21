class RemoveCategoryFromBookmates < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookmates, :book_category, :string
  end
end
