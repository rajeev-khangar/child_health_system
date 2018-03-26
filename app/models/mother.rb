class Mother < ApplicationRecord
  has_many :babies, inverse_of: :mother
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :physical_address, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true

end
