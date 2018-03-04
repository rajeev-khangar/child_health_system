class InfantFeedingLabel < ApplicationRecord
	has_many :infant_feeding_label_answers, dependent: :destroy
	validates :title, presence: true
	validates :input_type, inclusion: ["text", "checkbox"]
end
