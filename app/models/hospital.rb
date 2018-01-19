class Hospital < ApplicationRecord
	has_many :babies
	has_many :users, dependent: :destroy
    belongs_to :creator, polymorphic: true
	validates :name, presence: true
	validates :subdomain, presence: true
end
