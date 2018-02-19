class BabiesController < ApplicationController
  before_action :set_nurse, if: -> {current_user.nurse?}
  before_action :set_baby, only: [:show, :edit, :update, :destroy]

  def index
    @babies = if current_user.nurse? 
      @user.babies 
    elsif current_user.admin?
      Baby.where(hospital_id: current_user.hospital_ids)
    else
      Baby.where(hospital_id: current_user.hospital_id)
    end  
    authorize @babies
  end

  def new
    @baby = @user.babies.build
    authorize @baby
  end

  def create
    @baby = @user.babies.new(baby_params.merge(hospital_id: @hospital.id))
    authorize @baby
    if @baby.save
      flash[:success] = "created successfully."
      redirect_to hospital_user_babies_path
    else
      flash[:alert] = @baby.errors.full_messages.join(' ,')
      render 'new'
    end
  end	

  def show
  end

  def edit
  end

  def update
    if @baby.update(baby_params)
      flash[:success] = "Update Successfully." 
      redirect_to  hospital_user_babies_path
    else
      flash[:alert] = @baby.errors.full_messages.join(' ,')
      render 'edit'
    end
  end

  def destroy
    flash[:alert] = "Destroy Successfully." if @baby.destroy
    redirect_to  hospital_user_babies_path
  end

  private
    def set_baby
      @baby = @user.babies.find(params[:id])
      authorize @baby
    end

    def set_nurse
      @hospital = Hospital.find(params[:hospital_id])
      @user = @hospital.users.find(params[:user_id])
      @fathers = Father.all.collect{|f| [f.email, f.id]}
      @mothers = Mother.all.collect{|m| [m.first_name, m.id]}
    end
  
    def baby_params
      params.require(:baby).permit(:first_name, :middle_name, :last_name, :avatar, :sex, :date_of_birth, :place_of_birth, :health_center, :physical_address, :mother_id, :father_id, :hospital_id, healths_attributes: [:id, :height, :weight])
    end
end
