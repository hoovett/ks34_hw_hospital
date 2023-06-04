class Doctor < ApplicationRecord
  paginates_per 30
  belongs_to :department
  belongs_to :speciality
end
