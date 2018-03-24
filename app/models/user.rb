require 'csv'
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :babies
  belongs_to :hospital, optional: true
  has_many :hospitals, as: :creator
  validates :role, inclusion: { in: %w(admin manager nurse) }
  validates :hospital_id, presence: true, unless: -> {admin?}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true


  def admin?
    role.eql?"admin"
  end

  def manager?
    role.eql?"manager"
  end

  def nurse?
    role.eql?"nurse"
  end

  def import(babies)
    CSV.generate do |csv|
      if babies.present?
        babies.each do |baby|
          csv << ["BabyId", baby.id]
          csv << ["BabyName", baby.full_name]
          csv << ["Gender", baby.sex]
          age_arr = ["Age(month)"] 
          (0..60).each{|age| age_arr << age} 
          csv << age_arr
          height_arr = ["Height(cm)"]
          (0..60).each{|age| height_arr << baby.healths.find_by(age: age).try(:height)}
          csv << height_arr
          weight_arr = ["Weight(cm)"]
          (0..60).each{|age| weight_arr << baby.healths.find_by(age: age).try(:weight)}
          csv << weight_arr
          csv << []
        end
      else
        csv << ["You don't have any baby account."]
      end  
    end
  end
end
