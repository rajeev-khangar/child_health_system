class Vaccination < ApplicationRecord
    has_many :baby_vaccinations
    validates :age, presence: true
    validates :title, presence: true
end

