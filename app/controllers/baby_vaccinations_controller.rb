class BabyVaccinationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vaccination
  def index
    @baby_vaccinations = BabyVaccination.all
  end

  def new
    @baby_vaccination = BabyVaccination.new
  end

  def create
    @baby_vaccination = BabyVaccination.new(baby_vaccination_params)
    if @baby_vaccination.save
      flash[:success] = "created successfully."
      redirect_to hospital_user_babies_path(current_user.hospital, current_user)
    else
      flash[:alert] = @baby_vaccination.errors.full_messages.join(' ,')
      render 'new'
    end
  end

  private

  def set_vaccination
    @babies = current_user.babies
    @baby = @babies.first
    @vaccinations = Vaccination.all.collect{|v| [v.title, v.id]}
  end

  def baby_vaccination_params
    params.require(:baby_vaccination).permit(:baby_id, :vaccination_id, :date)
  end
  
 
end
    