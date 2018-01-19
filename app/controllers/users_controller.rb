class UsersController < ApplicationController
  before_action :set_hospital
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  

	def index
		@users = if current_user.admin?
      @hospital.users.where(role: "manager")
	  elsif current_user.manager?
      @hospital.users.where(role: "nurse")
	  end
	  authorize @users
	end

	def new
		@user = @hospital.users.new
		authorize @user
	end

	def create
	  @user = @hospital.users.new(user_params)
	  @user.role = if current_user.admin?
	  	"manager"
	  elsif current_user.manager?
	   "nurse"
	  end
	  authorize @user
	  if @user.save
	    flash[:success] = "created successfully."
	    redirect_to  hospital_users_path
	  else
	  	flash[:alert] = "Please fill required field."
	  	render 'new'
	  end
	end	

	def show
	end

	def edit

	end

	def update
      flash[:alert] = "Update Successfully." if @user.update(user_params)
      redirect_to hospital_users_path
	end

	def destroy
      flash[:alert] = "Destroy Successfully." if @user.destroy
      redirect_to hospital_users_path
    end

    private
    def set_user
      @user = @hospital.users.find(params[:id])
      authorize @user
    end


    def set_hospital
      @hospital = Hospital.find(params[:hospital_id])
    end
  
 
    def user_params
    params.require(:user).permit(:hospital_id, :first_name, :last_name, :email, :password)
    end
end