class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{user.name.capitalize}"
      redirect_to root_path
    else
      @user = user
      flash[:notice] = "Something went wrong!"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
