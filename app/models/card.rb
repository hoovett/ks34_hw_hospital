class Card < ApplicationRecord
  paginates_per 30
  belongs_to :hospital
  has_one :patient
end
