class SessionsController < ApplicationController
  
  def new
  	@user = User.new
  end

  def create
 	@user = User.confirm(login_params)
   	if @user
   		login(@user)
   		redirect_to user_path @user
   	else 
   		redirect_to login_path
   	end
  end

  def destroy
  	logout
  	redirect_to users_path
  end

  private
  	def login_params
  		params.require(:user).permit(:email, :password)
  	end

end
