class SessionsController < ApplicationController

  def new #login form
    binding.pry
  end

  def create #login
    binding.pry
    @user = User.find(params[:id])
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
