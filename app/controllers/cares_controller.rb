class CaresController < ApplicationController
  before_action :set_baby

  def new
    @care = @baby.cares.new
    #render "create"
  end

  def create
    @care = @baby.cares.new(care_params)
    if @care.save
      flash.now[:success] = "Care Form have been sucessfully fill up."
      #redirect_to hospital_user_babies_path(current_user.hospital, current_user)
    else
      flash.now[:alert] = @care.errors.full_messages.join(' ,')
    end
  end

  private
  
  def set_baby
    @baby = Baby.find(params[:baby_id])
  end

  def care_params
    params.require(:care).permit(:arv_supplied, :ctx_supplied, :initial_used, :initial_done, :initial_number, :initial_result, :initial_referred_art, :initial_initiated_art, :repeat_used, :repeat_done, :repeat_number, :repeat_result, :repeat_referred_art, :repeat_initiated_art,  :comments, :mother_art, :arv_prophylaxis_given_at_birth, :arv_prophylaxis_name, :breastfeeding_used, :breastfeeding_done, :breastfeeding_number, :breastfeeding_result, :breastfeeding_referred_art, :breastfeeding_initiated_art)
  end
end

