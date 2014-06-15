class CreateProspectCardLikes < ActiveRecord::Migration
  def change
    create_table :prospect_card_likes do |t|
      t.integer :user_id
      t.integer :prospect_card_id

      t.timestamps
    end
  end
end
