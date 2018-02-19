class MothersController < ApplicationController
  #before_action :set_nurse, if: -> {current_user.nurse?}
  before_action :set_mother, only: [:show, :edit, :update, :destroy]

  def index
   @mothers = Mother.all 
  end

  def new
    @mother = Mother.new
  end

  def create
    @mother = Mother.new(mother_params)
    if @mother.save
      flash[:success] = "created successfully."
      redirect_to mothers_path
    else
      flash[:alert] = @mother.errors.full_messages.join(' ,')
      render 'new'
    end
  end	

  def show
  end

  def edit
  end

  def update
    if @mother.update(mother_params)
      flash[:success] = "Update Successfully." 
      redirect_to  mothers_path
    else
      flash[:alert] = @mother.errors.full_messages.join(' ,')
      render 'edit'
    end
  end

  def destroy
    flash[:alert] = "Destroy Successfully." if @mother.destroy
    redirect_to  mothers_path
  end

  private
    def set_mother
      @mother = Mother.find(params[:id])
    end

  
    def mother_params
      params.require(:mother).permit(:first_name,:last_name, :avatar, :email, :national_id, :physical_address, :phone_number)
    end
end
    