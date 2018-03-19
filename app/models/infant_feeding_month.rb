class InfantFeedingMonth < ApplicationRecord
	has_many :baby_infant_feedings, dependent: :destroy
end
