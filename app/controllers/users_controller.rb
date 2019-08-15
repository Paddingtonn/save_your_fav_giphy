class UsersController < ApplicationController

  def index
    if current_user
      @users = User.all
      render 'index.html.erb'
    else
      flash[:warning] = "You must be logged in"
      redirect_to login_path
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:register_errors] = user.errors.full_messages
    end
  end

  private
  def user_params
      params.require(:user).permit(:name, :email, :password)
  end

end
