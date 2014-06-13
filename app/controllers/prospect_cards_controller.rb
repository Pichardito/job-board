class ProspectCardsController < ApplicationController

  def index

  end

  def new
    @prospect_card = ProspectCard.new
  end

  def create
    prospect_card = ProspectCard.create(card_params)
   # current_user.prospect_cards << prospect_card
    redirect_to show_path
  end

  def show
    @prospect_cards = ProspectCard.all
  end

  def edit

  end

  def upate

  end

  def destroy

  end

  private

  def card_params
    params.require(:prospect_card).permit(:name, :isa, :looking_for, :description)
  end

end
