class HealthsController < ApplicationController
  include HealthsHelper
  before_action :authenticate_user!
  before_action :set_baby

  def height
    height_age_chart_data(@baby)
  end

  def weight
    weight_age_chart_data(@baby)
  end

  def new
    @health = @baby.healths.new
  end

  def create
    @health = @baby.healths.new(healths_params)
     if @health.save
      flash[:success] = "Added successfully."
      redirect_to edit_hospital_user_baby_path(@baby.hospital_id, @baby.user_id, @baby.id)
    else
      flash[:alert] = @health.errors.full_messages.join(' ,')
      render 'new'
    end
  end 

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_baby
      @baby = Baby.find(params[:baby_id])
    end

    def healths_params
      params.require(:health).permit(:age, :height, :weight)
    end
end
