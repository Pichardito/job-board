class UpdateLikeModelsToTrackBetterInfoOnLikeEvent < ActiveRecord::Migration
  def change

    add_column :prospect_card_likes, :liker_first_name, :string
    add_column :prospect_card_likes, :liker_last_name, :string
    add_column :prospect_card_likes, :liker_email, :string
    remove_column :prospect_card_likes, :card_name, :string

    add_column :recruiter_card_likes, :liker_first_name, :string
    add_column :recruiter_card_likes, :liker_last_name, :string
    add_column :recruiter_card_likes, :liker_email, :string
    remove_column :recruiter_card_likes, :card_name, :string

  end
end
