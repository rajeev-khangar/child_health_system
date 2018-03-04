class BabyInfantFeeding < ApplicationRecord

   belongs_to :infant_feeding_label_answer
   belongs_to :infant_feeding_label
   belongs_to :baby

end
