class SessionsController < ApplicationController

  def new #login form
    binding.pry
  end

  def create
    binding.pry
    @user_id = User.find(params[:format].to_i)

    if @user_id
      session[:user_id] = @user_id

    else
      user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = user.id
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
