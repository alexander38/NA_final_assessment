class UsersController < ApplicationController

before_action :find_user, only: [:show, :edit, :update]

	def new
		@user = User.new
	end

	def create
		user = User.new(user_params)
  		if user.save
    		session[:user_id] = user.id
			redirect_to '/', notice: "Thanks for joining investment calculator"
		else
		  render "new"
		end
	end	

	def show
	end

	def edit

  end

  def update
  	if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end
	

private

	def user_params
  		params.require(:user).permit(:email, :password, :password_confirmation)
	end

	def find_user
    @user = User.find(params[:id])
  end
end
