class ProspectCardsController < ApplicationController

before_action :require_login

  def index
    @prospect_cards = ProspectCard.all
    @recruiter_cards = RecruiterCard.all
  end

  def new
    @prospect_card = ProspectCard.new
  end

  def create
    prospect_card = ProspectCard.create(prospect_card_params)
    current_user.prospect_cards << prospect_card
    redirect_to prospect_cards_path
  end

  def show
    @prospect_card = ProspectCard.find(params[:id])
  end

  def like
    prospect_card = ProspectCard.find(params[:id])
    new_like = ProspectCardLike.create({ :user_id => current_user.id, :prospect_card_id => prospect_card.id, :card_name => prospect_card.name, :card_details => prospect_card.description })
    current_user.prospect_card_likes << new_like
    prospect_card.prospect_card_likes << new_like
    redirect_to prospect_cards_path
  end

  def edit
    @prospect_card = ProspectCard.find(params[:id])
  end

  def update
    prospect_card = ProspectCard.find(params[:id])
    prospect_card.update(prospect_card_params)
    redirect_to prospect_cards_path
  end

  def destroy
    prospect_card = ProspectCard.find(params[:id])
    prospect_card.destroy
    render json: {}
  end

  private

  def prospect_card_params
    params.require(:prospect_card).permit(:name, :title, :looking_for, :description)
  end

end
