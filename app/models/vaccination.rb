class Vaccination < ApplicationRecord
    has_many :baby_vaccinations, dependent: :destroy
    has_many :babies, through: :baby_vaccinations
    validates :age, presence: true
    validates :title, presence: true
end

