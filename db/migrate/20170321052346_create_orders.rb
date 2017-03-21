class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.text :review
      t.float :rating
      t.string :delivery_type
      t.string :order_status
      t.string :delivery_status
      t.references :bookmate, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
