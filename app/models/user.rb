class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
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

end
