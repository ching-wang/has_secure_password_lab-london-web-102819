class SessionsController < ApplicationController
  def login
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to home_path
    else
      redirect_to "/login"
    end
  end
end
