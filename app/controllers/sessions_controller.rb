class SessionsController < ApplicationController

  def new #login form

  end

  def create #login
<<<<<<< HEAD
    token = params[:oauth_token]
    if token
      binding.pry
=======
    binding.pry
    @user = User.find_by(:email => params[:email])
    if @user.id
      session[:user_id] = @user.id
    else
>>>>>>> d9cf61c5989555b83b6d6177c94c682c5282cb57
      user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = user.id
    else
      binding.pry
      user = User.find_by(email: params[:email])
      session[:user_id] = user.id
    end
    redirect_to prospect_cards_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
