class AddUserImageAttributeToCards < ActiveRecord::Migration
  def change
    add_column :prospect_cards, :user_img, :string
    add_column :recruiter_cards, :user_img, :string
  end
end
