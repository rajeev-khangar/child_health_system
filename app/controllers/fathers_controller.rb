class FathersController < ApplicationController
  #before_action :set_nurse, if: -> {current_user.nurse?}
  before_action :set_father, only: [:show, :edit, :update, :destroy]

  def index
   @fathers = Father.all 
  end

  def new
    @father = Father.new
  end

  def create
    @father = Father.new(father_params)
    if @father.save
      flash[:success] = "created successfully."
      redirect_to fathers_path
    else
      flash[:alert] = @father.errors.full_messages.join(' ,')
      render 'new'
    end
  end	

  def show
  end

  def edit
  end

  def update
    if @fahter.update(father_params)
      flash[:success] = "Update Successfully." 
      redirect_to  fathers_path
    else
      flash[:alert] = @father.errors.full_messages.join(' ,')
      render 'edit'
    end
  end

  def destroy
    flash[:alert] = "Destroy Successfully." if @father.destroy
    redirect_to  fathers_path
  end

  private
    def set_father
      @father = Father.find(params[:id])
    end

  
    def father_params
      params.require(:father).permit(:first_name,:last_name, :avatar, :email, :national_id, :physical_address, :phone_number)
    end
end
    