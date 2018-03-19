class HospitalsController < ApplicationController
  before_action :set_hospital, only: [:show, :edit, :update, :destroy]

  
  def index
    @hospitals = current_user.hospitals
    authorize @hospitals
  end

  
  def show
  end

 
  def new
    @hospital = current_user.hospitals.new
  end

  
  def edit
  end

 
  def create
    @hospital = current_user.hospitals.new(hospital_params)
    if @hospital.save
      flash[:success] = "created successfully."
      redirect_to hospitals_path
    else
      flash[:alert] = @hospital.errors.full_messages.join(' ,')
      render 'new'
    end
  end

  def update
    if @hospital.update(hospital_params)
      flash[:success] = "Update Successfully." 
      redirect_to hospitals_path
    else
      flash[:alert] = @hospital.errors.full_messages.join(' ,')
      render 'new'
    end
  end

  def destroy
    flash[:alert] = "Destroy Successfully." if @hospital.destroy
    redirect_to hospitals_path
  end

  private
    def set_hospital
      @hospital = current_user.hospitals.find(params[:id])
      authorize @hospital
    end

    def hospital_params
      params.require(:hospital).permit(:name, :subdomain)
    end
end
