class User < ApplicationRecord
  has_many :loved_books, dependent: :destroy
  has_many :books, through: :loved_books
  has_many :bookmates, dependent: :destroy
  has_many :selling_books, through: :bookmates

  has_attachment :photo

  validates :first_name, presence: :true

  validates :email, presence: :true, uniqueness: :true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
