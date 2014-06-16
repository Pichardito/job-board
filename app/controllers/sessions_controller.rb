class SessionsController < ApplicationController

  def new #login form
  end

  def create #login
    token = params[:oauth_token]
    if token
      user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to prospect_cards_path
    else
      @user = login(params[:email], params[:password])
      if @user
        session[:user_id] = @user.id
        redirect_to prospect_cards_path
      else
        redirect_to(:login, notice: 'Login Failed')
      end
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to root_path
  end

end
