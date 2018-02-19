class Health < ApplicationRecord
  DAYS_IN_MONTH  = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

  belongs_to :baby, inverse_of: :healths
  validates :weight, presence: true
  validates :height, presence: true
  before_save :calculate_age

  def calculate_age
    borrowed_month = false

    current_date = Time.new
    birth_date = Time.parse(baby.date_of_birth)

    # Get days for this year
    if current_date.to_date.leap?
      DAYS_IN_MONTH[2] = 29
    end

    day   = current_date.day - birth_date.day
    month = current_date.month - birth_date.month
    year  = current_date.year - birth_date.year

    if day < 0
      # subtract month, get positive # for day
      day = DAYS_IN_MONTH[birth_date.month] - birth_date.day + current_date.day
      month -= 1
      borrowed_month = true
    end

    if month < 0
    # subtract year, get positive # for month
      month = 12 - birth_date.month + current_date.month
      if borrowed_month == true
        month -= 1
      end
      year -= 1
    end

    if year < 0
      year, month, day = 0, 0, 0
    end

    self.age = (year*12)+ month + (day>20 ? 1 : 0)
  end
end
