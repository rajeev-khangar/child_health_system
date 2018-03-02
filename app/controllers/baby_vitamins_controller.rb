class BabyVitaminsController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery with: :null_session 
  before_action :set_babies

  def new
  end

  private
  
  def set_babies
    @babies = Baby.all
    @baby = @babies.first
  end
end