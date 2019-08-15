class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email:login_params[:email])
    if user && user.authenticate(login_params[:password])
        session[:user_id] = user.id
        flash[:success] = "Seccesfully logged in!"
        redirect_to root_path
    else
        flash[:warning] = ['invalid credentials']
        redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "Succesfully logged out!"
    redirect_to login_path
  end

  private
  def login_params
    params.require(:login).permit(:email, :password)
  end
end
