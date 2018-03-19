class CareLabel < ApplicationRecord
  has_many :baby_cares, dependent: :destroy
  validates :title, presence: true
  validates :input_type, inclusion: ["text", "checkbox", "radio"]
  scope :only_checkbox, -> { where(input_type: "checkbox")}
  scope :only_text, -> { where(input_type: "text")}
  scope :only_radio, -> { where(input_type: "radio")}
  validate :validate_duration



  private
    
  def validate_duration
    if max_duration && min_duration
      errors.add(:max_duration, "always greater than min duration") if min_duration > max_duration
    end
  end

end
