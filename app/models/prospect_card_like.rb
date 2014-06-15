class ProspectCardLike < ActiveRecord::Base
  belongs_to :users
  belongs_to :prospect_cards
end
