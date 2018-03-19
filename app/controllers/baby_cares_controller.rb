class BabyCaresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_baby, :initialize_data

  def new
    @baby_care = @baby.baby_cares.build
    

  end

  def create
    if @baby.update(baby_care_params)
      flash[:success] = "created successfully."
      redirect_to hospital_user_babies_path(current_user.hospital, current_user)
    else
      flash[:alert] = @baby.errors.full_messages.join(' ,')
      render 'new'
    end
  end

  private

  def initialize_data
    @care_labels = CareLabel.all
    @care_months = CareMonth.all
  end

  def set_baby
    @baby = Baby.find(params[:baby_id])

  end

  def baby_care_params
    params.require(:baby).permit(baby_cares_attributes: [:id, :baby_id,  :care_label_id, :description, :care_month_id, :comment ])
  end
end
    