class SessionsController < ApplicationController

  def new #login form
    @user = User.new
  end

  def create #login
    token = params[:oauth_token]
    if token
      @user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = @user.id
      redirect_to prospect_cards_path
    else
      @user = login(params[:email], params[:password])
      if @user
        session[:user_id] = @user.id
        redirect_to prospect_cards_path
      else
        if User.find_by(email: params[:email])
          flash[:notice] = "Incorrect email/password combination"
          render 'new'
        else
          flash[:notice] = "No account found with that email address, please try again"
          render 'new'
        end
      end
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to login_path
  end

end
