class BabyInfantFeeding < ApplicationRecord
   belongs_to :infant_feeding_label
   belongs_to :infant_feeding_month, optional: true
end
