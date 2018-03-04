class RiskFactorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_risk_factor, only: [:show, :edit, :update, :destroy]
  

  def index
   @risk_factors = RiskFactor.all if current_user.admin?
  end

  def new
    @risk_factor = RiskFactor.new
  end

  def create
    if current_user.admin?
      @risk_factor = RiskFactor.new(risk_factor_params)
      if @risk_factor.save
        flash[:success] = "Added successfully."
        redirect_to  risk_factors_path
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
    if @risk_factor.update(risk_factor_params)
      flash[:alert] = "Update Successfully." 
      redirect_to risk_factors_path
    else
      flash[:alert] = @risk_factor.errors.full_messages.join(' ,')
      render 'edit'
    end
  end

  def destroy
    flash[:alert] = "Destroy Successfully." if @risk_factor.destroy
    redirect_to risk_factors_path
  end

  private
    
    def set_risk_factor
      @risk_factor = RiskFactor.find(params[:id])
    end

    def risk_factor_params
      params.require(:risk_factor).permit(:title)
    end
end