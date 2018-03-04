class RiskFactor < ApplicationRecord
  has_many :baby_risk_factors
  validates :title, presence: true
end
