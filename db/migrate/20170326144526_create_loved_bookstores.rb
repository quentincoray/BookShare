class CreateLovedBookstores < ActiveRecord::Migration[5.0]
  def change
    create_table :loved_bookstores do |t|
      t.references :user, foreign_key: true
      t.references :bookmate, foreign_key: true

      t.timestamps
    end
  end
end
