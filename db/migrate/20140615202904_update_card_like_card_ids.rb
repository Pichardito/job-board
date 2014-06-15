class UpdateCardLikeCardIds < ActiveRecord::Migration
  def change
    rename_column(:recruiter_card_likes, :recruiter_card_id, :card_id)
    rename_column(:prospect_card_likes, :prospect_card_id, :card_id)
  end
end
