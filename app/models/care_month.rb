class CareMonth < ApplicationRecord
  has_many :baby_cares, dependent: :destroy

end
