class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    begin
      @user = User.create(user_params)
      if @user.save!
        session[:user_id] = @user.id
        redirect_to prospect_cards_path
      else
      end
    rescue ActiveRecord::RecordInvalid => invalid
        render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @prospect_cards = @user.prospect_cards
    @recruiter_cards = @user.recruiter_cards
    @my_prospect_card_likes = ProspectCard.likes_for_user_cards(@user)
    @my_recruiter_card_likes = RecruiterCard.likes_for_user_cards(@user)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    begin
      @user.update(user_params)
      if @user.save!
      redirect_to user_path(@user)
    else
    end
    rescue ActiveRecord::RecordInvalid => invalid
      render 'edit'
    end
  end

  def destroy
    User.delete(params[:id])
    session[:user_id] = nil

    # Is this render appropriate?
    #render json: {}
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
