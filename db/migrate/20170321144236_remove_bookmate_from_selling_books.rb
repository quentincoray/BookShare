class RemoveBookmateFromSellingBooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :selling_books, :bookmate_id, :string
  end
end
