class HospitalPolicy < ApplicationPolicy
  def index? 
    true
  end

  def show?
    return true if user.present? && user.hospitals.include?(hospital)
  end

  def create?
    return true if user.present? && user.hospitals.include?(hospital)
  end
 
  def update?
    return true if user.present? && user.hospitals.include?(hospital)
  end
 
  def destroy?
    return true if user.present? && user.hospitals.include?(hospital)
  end
 
  private
 
    def hospital
      record
    end
end