class CreateRecruiterCardLikes < ActiveRecord::Migration
  def change
    create_table :recruiter_card_likes do |t|
      t.integer :user_id
      t.integer :recruiter_card_id

      t.timestamps
    end
  end
end
