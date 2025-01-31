class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if user_params[:password] != user_params[:password_confirmation]
        redirect_to controller: "users", action: "new"
    else
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to '/users/home'
    end
  end

  def home
    unless session.include? :user_id
      redirect_to '/login'
    end
    @user = User.find(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
  
end
