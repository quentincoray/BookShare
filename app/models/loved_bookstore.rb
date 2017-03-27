class LovedBookstore < ApplicationRecord
  belongs_to :user
  belongs_to :bookmate
end
