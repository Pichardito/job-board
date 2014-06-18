  class RecruiterCardsController < ApplicationController

before_action :require_login

def new
  @recruiter_card = RecruiterCard.new
end

def create
  recruiter_card = RecruiterCard.create(recruiter_card_params)
  current_user.recruiter_cards << recruiter_card
  redirect_to prospect_cards_path
end

def show
  @recruiter_card = RecruiterCard.find(params[:id])
end

  def like
    recruiter_card = RecruiterCard.find(params[:id])
    new_like = RecruiterCardLike.create({ :user_id => current_user.id,
                                          :recruiter_card_id => recruiter_card.id,
                                          :card_details => recruiter_card.looking_for,
                                          :liker_first_name => current_user.first_name,
                                          :liker_last_name => current_user.last_name,
                                          :liker_email => current_user.email
                                        })
    current_user.recruiter_card_likes << new_like
    recruiter_card.recruiter_card_likes << new_like
    redirect_to prospect_cards_path
  end

def edit
  @recruiter_card = RecruiterCard.find(params[:id])
end

def update
  recruiter_card = RecruiterCard.find(params[:id])
  recruiter_card.update(recruiter_card_params)
  redirect_to prospect_cards_path
end

def destroy
  recruiter_card = RecruiterCard.find(params[:id])
  recruiter_card.destroy
  render json: {}
end

private

def recruiter_card_params
  params.require(:recruiter_card).permit(:name, :title, :looking_for, :description, :user_img, :left_pos, :top_pos)
end

end
