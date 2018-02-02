class Baby < ApplicationRecord
	DAYS_IN_MONTH  = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
	SEVERE_STUNTED_HEIGHT   =  [43,48,51,52.5,54.5,57.5,59,60.5,62,63,64,65,66,67,68,69,70,71,72,73,73.5,75,76,76.5,77,77.5,78,78.5,79.5,80,80.5,81,82,82.5,83,83.5,84,84.5,85,85.5,86,86.5,87,87.5,88,88.5,89,89,90,90.5,91,91.5,92,92.5,93,93.5,94,94,94.5,95]
	MODERATE_STUNTED_HEIGHT =  [46,50,53,55.5,58,59.5,61,62.5,64,65,66.5,67.5,67,70,71,72,73,74,75,76,76.5,77.5,78,79,80,80,80.5,81.5,82,83,83.5,84,85,85.5,86,86.5,87,88,88.5,89,89.5,90,90.5,91,92,92.5,93,93.5,94,94.5,95,95.5,96,96.5,97,97.5,98,98.5,99,99,99.5]
	NORMAL                  =  [49,54,57,58.5,62,64,65.5,67,68.5,70,70,72.5,74,75,76,77,78,79,80,80.5,82.5,83,84,85,86,86,87,88,88.5,89.5,90,91,92,92.5,93,94,94.5,95,96,96.5,97,98,98.5,99,100,100.5,101,101.5,102,103,103.5,104,104.5,105,105.5,106,106.5,107,108,108.5,109]
    NORMAL2                 =  [53,58,61,64,66.5,68.5,70,72,73.5,75,76,77.5,79,80,81.5,83,84,85,86,86.5,88.5,89.5,91,92,93,93,94,95,96,96.5,97.5,98.5,99,100,101,101.5,102.5,103,104,104.5,105.5,106,106.5,107.5,108,109,110,110.5,111,111.5,112,113,113.5,114,115,115.5,116,117,117.5,118,118.5] 
    POSSIBLE_VERY_TALL      =  [55,60,63,66,68.5,70.5,72.5,74,75.5,77,79,80,81.5,83,84.5,85.5,87,88,88.5,90.5,91.5,92.5,94,95,96,96,97.5,98.5,99,100,101,102,103,103.5,104.5,105.5,106,107,108,108.5,109.5,110,111,115.5,112.5,113,114,114.5,115,116,116.5,117.5,118,119,119.5,120,120.5,121,122,122.5,123]
    SEVERE_UNDER_WEIGHT     =  [2,2.6,3.5,4,4.4,4.8,5,5.4,5.6,5.8,6,6.2,6.3,6.4,6.6,6.8,6.9,7,7.2,7.4,7.6,7.7,7.8,8,8.1,8.2,8.4,8.5,8.6,8.8,8.9,9,9.2,9.3,9.4,9.6,9.7,9.8,9.9,10,10.1,10.2,10.3,10.4,10.5,10.6,10.7,10.8,10.9,11,11.1,11.2,11.3,11.4,11.5,11.6,11.8,11.9,12,12,12.1]
    MODERATE_UNDER_WEIGHT   =  [2.4,3.2,4,4.6,5,5.4,5.8,6,6.2,6.4,6.6,6.8,7,7.2,7.4,7.6,7.8,8.9,8.1,8.3,8.4,8.6,8.8,8.9,9.1,9.2,9.4,9.6,9.7,9.8,10,10.1,10.2,10.4,10.6,10.7,10.8,11,11.1,11.2,11.4,11.5,11.6,11.8,11.9,12,12.1,12.2,12.4,12.5,12.6,12.7,12.8,12.9,13,13.2,13.3,13.4,13.6,13.6,13.7]
    NORMAL_WEIGHT           =  [3.2,4.2,5,5.8,6.4,6.8,7.2,7.6,7.8,8.2,8.4,8.6,8.8,9,9.2,9.4,9.8,10,10.2,10.4,10.6,10.8,11,11.2,11.4,11.4,11.8,12,12.2,12.4,12.6,12.8,13,13.2,13.4,13.6,13.8,14,14.1,14.2,14.3,14.6,14.8,15,15.2,15.4,15.6,15.8,16,16.2,16.4,16.5,16.8,16.9,17.1,17.2,17.4,17.6,17.8,17.9,18]
    POSSIBLE_OVERWEIGHT     =  [4.2,5.4,6.6,7.6,8.2,8.8,9.4,9.8,10.2,10.6,10.9,11.2,11.4,11.8,12,12.4,12.6,12.9,13.2,13.4,13.8,14,14.2,14.6,14.8,15,15.4,15.6,16,16.2,16.4,16.8,17.2,17.3,17.6,17.8,18,18.4,18.6,19,19.2,19.4,19.8,20,20.2,20.6,20.8,21.1,21.4,21.6,22,22.2,22.4,22.8,23,23.2,23.8,24,24.2,24.4,24.8]
    CHECK_WEIGHT_FOR_HEIGHT =  [4.8,6.2,7.6,8.6,9.4,10,10.7,11,11.6,12,12.2,12.8,13,13.4,13.8,14.2,14.4,14.8,15.2,15.4,15.6,16,16.2,16.6,17,17.2,17.6,18,18.2,18.6,19,19.2,19.6,19.9,20.2,20.4,20.8,21.2,21.4,22,22.2,22.4,22.8,23.2,23.6,24,24.4,24.6,25,25.4,25.8,26,26.4,26.8,27.2,27.4,27.8,28.2,28.6,29,29.2]


	belongs_to :hospital
    belongs_to :user,  optional: true
	belongs_to :mother
	belongs_to :father

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :date_of_birth, presence: true
	validates :place_of_birth, presence: true
	validates :physical_address, presence: true
	validates :mother_id, presence: true
	validates :father_id, presence: true
	validates :sex, presence: true
	validates :weight, presence: true
	validates :height, presence: true
	before_save :calculate_age

	def self.avg_height(babies)
		babies.present? ? babies.sum(:height)/babies.count : 0
	end

	def self.avg_weight(babies)
		babies.present? ? babies.sum(:weight)/babies.count : 0
	end

	def calculate_age
	  borrowed_month = false

	  current_date = Time.new
	  birth_date = Time.parse(date_of_birth)

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
