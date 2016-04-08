class UsersController < ApplicationController

  def index
  end

  def new
  	@user = User.new
  end

  
  def show
  	@user = User.find(params[:id])

  	#-- Start a debugging session in server(byebugs)
  	# debugger
  end

  def create
  	 @user = User.new(user_params)
    if @user.save
      log_in @user
      remember @user
    	flash[:success] = "Welcome to the Sample App!"
    	redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
