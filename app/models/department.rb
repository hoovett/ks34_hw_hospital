class Department < ApplicationRecord
  paginates_per 30
  belongs_to :hospital
  has_many :doctor
end
