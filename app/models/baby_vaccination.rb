class BabyVaccination < ApplicationRecord
  belongs_to :vaccination
  belongs_to :baby
  validates :date, presence: true
  validates :vaccination_id, presence: true

  VACCINATION_DOSE = ["dose 1" , "dose 2", "dose 3"]
end
