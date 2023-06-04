class Hospital < ApplicationRecord
  paginates_per 30
  has_many :departments
  has_one :card
  has_one_attached :avatar
end
