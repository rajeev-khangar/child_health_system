class VitaminAsController < ApplicationController
  protect_from_forgery with: :null_session 
  before_action :set_baby

  def new
    render "create"
  end

  def create
    @vitamin_a = @baby.vitamin_as.new(vitamin_params)
    if @vitamin_a.save
      flash[:success] = "Vitamin A Suppliment taken sucessfully."
      redirect_to hospital_user_babies_path(current_user.hospital, current_user)
    else
      flash[:alert] = @vitamin_a.errors.full_messages.join(' ,')
      render 'new'
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    def set_baby
      @baby = Baby.find(params[:baby_id])
    end

    def vitamin_params
      params.require(:vitamin_a).permit(:month_duration)
    end
end
    