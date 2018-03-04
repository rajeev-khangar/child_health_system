class InfantFeedingLabelAnswer < ApplicationRecord
	belongs_to :infant_feeding_label
	validates :description, presence: true
end
