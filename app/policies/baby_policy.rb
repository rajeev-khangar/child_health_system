class BabyPolicy < ApplicationPolicy
  def index?
    true
  end
 
  def create?
    user.present?
  end

  def show?
    return true if (user.present? && user == baby.user) || user.manager?
  end
 
  def update?
    return true if (user.present? && user == baby.user) || user.manager?
  end
 
  def destroy?
    return true if (user.present? && user == baby.user) || user.manager?
  end

  def send_email?
    return true if (user.present? && user == baby.user) || user.manager?
  end
 
  private
 
    def baby
      record
    end
end