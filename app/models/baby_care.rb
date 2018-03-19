class BabyCare < ApplicationRecord
   HIV_TEST_TYPE = [ "Type of test used", "Date test done", "Test number", "Test Result(Code 0/1)", "Date Referred for ART", "Date initiated on ART "] 
   belongs_to :care_label, optional: true
   belongs_to :care_month, optional: true
   belongs_to :baby
end
