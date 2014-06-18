class ProspectCard < ActiveRecord::Base
  belongs_to :users
  has_many :prospect_card_likes

  scope :likes_for_user_cards, ->(user) { ProspectCardLike.where(prospect_card_id: user.prospect_cards) }
end
