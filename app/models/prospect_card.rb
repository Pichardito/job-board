class ProspectCard < ActiveRecord::Base
  belongs_to :users
  has_many :prospect_card_likes
end
