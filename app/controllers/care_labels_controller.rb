class CareLabelsController < ApplicationController
  before_action :authenticate_user!
  before_action :initialize_data
  before_action :set_care_label, only: [:show, :edit, :update, :destroy]
  

  def index
   @care_labels = CareLabel.all 
  end

  def new
    @care_label = CareLabel.new
  end

  def create
    if current_user.admin?
      @care_label = CareLabel.new(care_label_params)
      if @care_label.save
        flash[:success] = "Added successfully."
        redirect_to  care_labels_path
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
    if @care_label.update(care_label_params)
      flash[:alert] = "Update Successfully." 
      redirect_to care_labels_path
    else
      flash[:alert] = @care_label.errors.full_messages.join(' ,')
      render 'edit'
    end
  end

  def destroy
    flash[:alert] = "Destroy Successfully." if @care_label.destroy
    redirect_to care_labels_path
  end

  private
    def initialize_data
      @care_months = CareMonth.all
      @months = @care_months.collect{|c|  [c.title, c.order]}
    end
    
    def set_care_label
      @care_label = CareLabel.find(params[:id])
    end

    def care_label_params
      params.require(:care_label).permit(:title, :input_type, :min_duration, :max_duration)
    end
end
