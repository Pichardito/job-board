class AddUserIdToProspectCards < ActiveRecord::Migration
  def change
    add_column :prospect_cards, :user_id, :integer
    add_index :prospect_cards, :user_id
  end
end
