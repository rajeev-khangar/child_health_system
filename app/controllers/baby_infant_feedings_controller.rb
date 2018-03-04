class BabyInfantFeedingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_baby, :initialize_data

  def new
    @baby_infant_feeding = @baby.baby_infant_feedings.build

  end

  def create
    if @baby.update(baby_infant_feeding_params)
      flash[:success] = "created successfully."
      redirect_to hospital_user_babies_path(current_user.hospital, current_user)
    else
      flash[:alert] = @baby.errors.full_messages.join(' ,')
      render 'new'
    end
  end

  private

  def initialize_data
    @infant_feeding_labels = InfantFeedingLabel.all
  end

  def set_baby
    @baby = Baby.find(params[:baby_id])
  end

  def baby_infant_feeding_params
    params.require(:baby).permit(baby_infant_feedings_attributes: [:id, :baby_id, :infant_feeding_label_answer_id, :infant_feeding_label_id, :description])
  end
end
    