class AddPositionAttributesToCards < ActiveRecord::Migration
  def change
    add_column :prospect_cards, :left_pos, :integer
    add_column :prospect_cards, :top_pos, :integer
    add_column :recruiter_cards, :left_pos, :integer
    add_column :recruiter_cards, :top_pos, :integer
  end
end
