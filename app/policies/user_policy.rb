class UserPolicy < ApplicationPolicy
  def index?
    if user.manager?
      return true #if @record.present? && @record.first.hospital_id== user.hospital_id
    elsif user.admin?
      return true
    end
  end

  def show?
     if user.manager?
      return true if  record.hospital_id == user.hospital_id
    elsif user.admin?
      return true if @record.hospital.creator== user
    end
  end

  def create?
    if user.manager?
      return true #if @record.present? && @record.first.hospital_id== user.hospital_id
    elsif user.admin?
      return true #if @record.hospital.creator== user
    end
  end
 
  def update?
    if user.manager?
      return true if  record.hospital_id == user.hospital_id
    elsif user.admin?
      return true if @record.hospital.creator== user
    end
  end
 
  def destroy?
    if user.manager?
      return true if  record.hospital_id == user.hospital_id
    elsif user.admin?
      return true if @record.hospital.creator== user
    end
  end   
end