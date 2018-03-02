class BabyRiskFactor < ApplicationRecord
  belongs_to :baby, inverse_of: :baby_risk_factors
  belongs_to :risk_factor, inverse_of: :baby_risk_factors
end
