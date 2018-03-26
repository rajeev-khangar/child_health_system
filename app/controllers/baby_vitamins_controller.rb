class BabyVitaminsController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery with: :null_session 
  before_action :set_babies

  def new
  end

  private
  
  def set_babies
    if current_user.nurse?
      @babies = current_user.babies.all
    else
      @babies = Baby.where(hospital_id: current_user.hospital_id)
    end
    @baby = @babies.first 
  end
end