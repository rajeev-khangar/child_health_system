class InfantFeedingLabelAnswersController < ApplicationController
  before_action :set_infant_feeding_label
  before_action :set_infant_feeding_label_answer, only: [:show, :edit, :update, :destroy]

  def index
   @infant_feeding_label_answers = @infant_feeding_label.infant_feeding_label_answers.all
  end

  def new
    @infant_feeding_label_answer = @infant_feeding_label.infant_feeding_label_answers.new
  end

  def create
    @infant_feeding_label_answer = @infant_feeding_label.infant_feeding_label_answers.new(infant_feeding_label_answer_params)
    if @infant_feeding_label_answer.save
      flash.now[:success] = "Vitamin A Suppliment taken sucessfully."
       redirect_to  infant_feeding_label_infant_feeding_label_answers_path
    else
      flash.now[:alert] = @infant_feeding_label_answer.errors.full_messages.join(' ,')
      render 'new'
    end
  end

  def show
  end

  def edit
  end
  
  def update
    if @infant_feeding_label_answer.update(infant_feeding_label_answer_params)
      flash[:success] = "Update Successfully." 
      redirect_to  infant_feeding_label_infant_feeding_label_answers_path
    else
      flash[:alert] = @user.errors.full_messages.join(' ,')
      render 'edit'
    end
  end

  def destroy
    flash[:alert] = "Destroy Successfully." if @infant_feeding_label_answer.destroy
    redirect_to  infant_feeding_label_infant_feeding_label_answers_path
  end

  private
  
  def set_infant_feeding_label_answer
    @infant_feeding_label_answer = @infant_feeding_label.infant_feeding_label_answers.find(params[:id])
  end
  
  def set_infant_feeding_label
    @infant_feeding_label = InfantFeedingLabel.find(params[:infant_feeding_label_id])
  end

  def infant_feeding_label_answer_params
    params.require(:infant_feeding_label_answer).permit(:description)
  end
end
   