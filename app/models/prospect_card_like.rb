class ProspectCardLike < ActiveRecord::Base
  belongs_to :user
  belongs_to :prospect_card
end
