class RenameCardLikeAttributesToProspectOrRecruiterCardId < ActiveRecord::Migration
  def change
    rename_column(:recruiter_card_likes, :card_id, :recruiter_card_id)
    rename_column(:prospect_card_likes, :card_id, :prospect_card_id)
  end
end
