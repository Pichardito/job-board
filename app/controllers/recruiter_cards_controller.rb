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
  redirect_to prospect_cards_path
end

private

def recruiter_card_params
  params.require(:recruiter_card).permit(:name, :title, :looking_for, :description)
end

end
