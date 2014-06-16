class AddCardAttributesToLikeModels < ActiveRecord::Migration
  def change
    add_column :prospect_card_likes, :card_name, :string
    add_column :prospect_card_likes, :card_details, :string
    add_column :recruiter_card_likes, :card_name, :string
    add_column :recruiter_card_likes, :card_details, :string
  end
end
