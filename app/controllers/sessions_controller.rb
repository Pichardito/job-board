class SessionsController < ApplicationController

  def new #login form

  end

  def create #login
    @user = User.find_by(:email => params[:email])
    if @user.id
      session[:user_id] = @user.id

    else
      user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = user.id
    end
    redirect_to prospect_cards_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
