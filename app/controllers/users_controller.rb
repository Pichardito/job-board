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
    @prospect_card_likes = @user.prospect_card_likes.all
    @recruiter_card_likes = @user.recruiter_card_likes.all

    #GETTING LIKES ASSOCIATED WITH USERS CARDS
    #THESE GET ALL THE USERS PROSPECT AND RECRUITER CARDS
    all_prospect_cards = @user.prospect_cards.all
    all_recruiter_cards = @user.recruiter_cards.all

    #THESE RETURN AN ARRAY OF THE CARD IDS BASED ON THE CARDS FOUND ABOVE
    all_prospect_card_ids = @user.get_ids(all_prospect_cards)
    all_recruiter_card_ids = @user.get_ids(all_recruiter_cards)

    #THESE RETURN AN ARRAY OF THE LIKES ASSOCIATED WITH THE CARDS ABOVE
    prospect_card_likes = @user.get_card_likes(all_prospect_card_ids, 'prospect')
    recruiter_card_likes = @user.get_card_likes(all_recruiter_card_ids, 'recruiter')

    #THIS RETURNS THE TOTAL NUMBER OF LIKES THE USER HAS RECEIVED
    total_likes = prospect_card_likes.count + recruiter_card_likes.count

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
