class BabyVaccination < ApplicationRecord
  belongs_to :vaccination
  belongs_to :baby
  validates :date, presence: true
  validates :vaccination_id, presence: true
end
