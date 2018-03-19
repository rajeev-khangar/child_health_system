class InfantFeedingLabelsController < ApplicationController
  before_action :authenticate_user!
  before_action :initialize_data
  before_action :set_infant_feeding_label, only: [:show, :edit, :update, :destroy]
  

  def index
   @infant_feeding_labels = InfantFeedingLabel.all 
  end

  def new
    @infant_feeding_label = InfantFeedingLabel.new
  end

  def create
    if current_user.admin?
      @infant_feeding_label = InfantFeedingLabel.new(infant_feeding_label_params)
      if @infant_feeding_label.save
        flash[:success] = "Added successfully."
        redirect_to  infant_feeding_labels_path
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
    if @infant_feeding_label.update(infant_feeding_label_params)
      flash[:alert] = "Update Successfully." 
      redirect_to infant_feeding_labels_path
    else
      flash[:alert] = @infant_feeding_label.errors.full_messages.join(' ,')
      render 'edit'
    end
  end

  def destroy
    flash[:alert] = "Destroy Successfully." if @infant_feeding_label.destroy
    redirect_to infant_feeding_labels_path
  end

  private

    def initialize_data
      @infant_feeding_months = InfantFeedingMonth.all
      @months= @infant_feeding_months.collect {|m| [m.title, m.order]}
    end
    
    def set_infant_feeding_label
      @infant_feeding_label = InfantFeedingLabel.find(params[:id])
    end

    def infant_feeding_label_params
      params.require(:infant_feeding_label).permit(:title, :input_type, :min_duration, :max_duration)
    end
end