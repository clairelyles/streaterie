class SessionsController < ApplicationController

  before_action :current_user

  def new

  end

  def create
    @user = User.authenticate(params[:user][:email],params[:user][:password])

    # render json:@user
    if @user
      session[:user_id] = @user.id
      flash[:success] = 'You have been logged in!'
      redirect_to root_path
    else
      flash[:success] = 'Credentials invalid! Please try again'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You've been logged out!"
    redirect_to login_path
  end

end