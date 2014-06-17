class WelcomeController < ApplicationController

def index
  redirect_to prospect_cards_path if current_user
end

end
