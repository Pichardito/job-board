class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      redirect_to signup_path
      redirect_to(:signup, notice: 'Sorry, but your account could not be created. Please try with a different email address or longer password.')
    end

  end

  def show
    @user = User.find(params[:id])
    @prospect_card_likes = @user.prospect_card_likes.all
    @recruiter_card_likes = @user.recruiter_card_likes.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end

  def destroy
    User.delete(params[:id])
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
