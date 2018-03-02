class Father < ApplicationRecord
  has_many :babies, inverse_of: :father
  validates :email, presence: true

end
