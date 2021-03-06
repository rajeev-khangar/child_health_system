class InfantFeedingLabel < ApplicationRecord

  has_many :baby_infant_feedings, dependent: :destroy
  validates :title, presence: true
  validates :input_type, inclusion: ["text", "checkbox"]
  scope :only_checkbox, -> { where(input_type: "checkbox")}
  scope :only_text, -> { where(input_type: "text")}
  validate :validate_duration



  private
    
  def validate_duration
    if max_duration && min_duration
      errors.add(:max_duration, "always greater than min duration") if min_duration > max_duration
    end
  end

end
