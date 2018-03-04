class VaccinationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vaccination, only: [:show, :edit, :update, :destroy]
  

  def index
   @vaccinations = Vaccination.all if current_user.admin?
  end

  def new
    @vaccination = Vaccination.new
  end

  def create
    if current_user.admin?
      @vaccination = Vaccination.new(vaccination_params)
      if @vaccination.save
        flash[:success] = "Added successfully."
        redirect_to  vaccinations_path
      else
        flash[:alert] = "Please fill required field."
        render 'new'
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @vaccination.update(vaccination_params)
      flash[:alert] = "Update Successfully." 
      redirect_to vaccinations_path
    else
      flash[:alert] = @vaccination.errors.full_messages.join(' ,')
      render 'edit'
    end
  end

  def destroy
    flash[:alert] = "Destroy Successfully." if @vaccination.destroy
    redirect_to vaccinations_path
  end

  private
    
    def set_vaccination
      @vaccination = Vaccination.find(params[:id])
    end

    def vaccination_params
      params.require(:vaccination).permit(:title, :age, :description)
    end
end