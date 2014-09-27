class UsersController < ApplicationController
  def new
  
  end

  def create
  	# render :text => "名前：#{params[:user]}"
  	@user = User.new(user_params)

  	if @user.save
  		redirect_to users_url
  	else 
  		render 'new'
  	end
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to users_url
  end

  def index
  	@user = User.all
  end

  private 
  	def user_params
  		params.require(:user).permit(:name, :email)
  	end
end
