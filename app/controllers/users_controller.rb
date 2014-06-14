class UsersController < ApplicationController

skip_before_filter :require_login, only: [:index, :new, :create]
def new
  @user = User.new
end

def create
  @user = User.create(user_params)
  redirect_to login_path(@user, :id => params[:id])
end

private

def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :password)
end

end
