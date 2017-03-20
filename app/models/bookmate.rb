class Bookmate < ApplicationRecord
  belongs_to :user
  has_many :selling_books, dependent: :destroy
  has_many :books, through: :selling_books

  validates :description, presence: :true
  validates :deliver_by_hand, inclusion: { in: [ true, false ] }
  validates :home_delivery, inclusion: { in: [ true, false ] }
end
