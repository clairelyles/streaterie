class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Successful sign-in"
      redirect_to login_path
    else
      flash[:notice] = "Unable to sign-up, please try again"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

end