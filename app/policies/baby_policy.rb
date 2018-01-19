class BabyPolicy < ApplicationPolicy
  def index?
    true
  end
 
  def create?
    user.present?
  end

  def show?
    return true if user.present? && user == baby.user
  end
 
  def update?
    return true if user.present? && user == baby.user
  end
 
  def destroy?
    return true if user.present? && user == baby.user
  end
 
  private
 
    def baby
      record
    end
end