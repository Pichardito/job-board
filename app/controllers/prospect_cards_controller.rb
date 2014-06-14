class ProspectCardsController < ApplicationController

  def index
    @prospect_cards = ProspectCard.all
  end

  def new
    @prospect_card = ProspectCard.new
  end

  def create
    prospect_card = ProspectCard.create(card_params)
   # current_user.prospect_cards << prospect_card
    redirect_to prospect_cards_path
  end

  def show
    @prospect_cards = ProspectCard.all
  end

  def edit

  end

  def update

  end

  def destroy
    @prospect_card.destroy
    respond_to do |format|
      format.html { redirect_to prospect_cards_path }
      format.json
    end

  end

  private

  def card_params
    params.require(:prospect_card).permit(:name, :title, :looking_for, :description)
  end

end
