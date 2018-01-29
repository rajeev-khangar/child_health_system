class ManagersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_hospitals
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  

	def index
		@users = User.where(role: "manager", hospital_id: current_user.hospitals.ids) if current_user.admin?
	    authorize @users
	end

	def new
		@user = User.new
		authorize @user
	end

	def create
	    if current_user.admin?
	     @user = User.new(user_params)
	     @user.role = "manager"
		  if @user.save
		    flash[:success] = "created successfully."
		    redirect_to  managers_path
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
		if @user.update(user_params)
	      flash[:alert] = "Update Successfully." 
	      redirect_to managers_path
	    else
	      flash[:alert] = @user.errors.full_messages.join(' ,')
	  	  render 'edit'
	    end
	end

	

	def destroy
	    flash[:alert] = "Destroy Successfully." if @user.destroy
	    redirect_to managers_path
    end

  private
    def set_user
      @user = User.find(params[:id])
      authorize @user
    end


    def load_hospitals
    	@hospitals = current_user.hospitals.collect{|f| [f.name, f.id]}	
    end
    
    

 
    def user_params
      params.require(:user).permit(:hospital_id, :first_name, :last_name, :email, :password)
    end
end