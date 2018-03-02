class InfantFeedingsController < ApplicationController
  before_action :set_baby

  def new
    @infant_feeding = @baby.infant_feedings.new
    #render "create"
  end

  def create
    @infant_feeding = @baby.infant_feedings.new(infant_feeding_params)
    if @infant_feeding.save
      flash.now[:success] = "Vitamin A Suppliment taken sucessfully."
    else
      flash.now[:alert] = @infant_feeding.errors.full_messages.join(' ,')
    end
  end

  private
  
  def set_baby
    @baby = Baby.find(params[:baby_id])
  end

  def infant_feeding_params
    params.require(:infant_feeding).permit(:breast_milk, :duration, :except_breast_milk, :breastfeeding_hour_delivery, :complementary_foods, :breastfeeding_continues, :food_groups_given_day, :no_of_meals_day)
  end
end
   