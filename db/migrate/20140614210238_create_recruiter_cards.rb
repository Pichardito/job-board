class CreateRecruiterCards < ActiveRecord::Migration
  def change
    create_table :recruiter_cards do |t|
      t.string :name
      t.string :title
      t.string :looking_for
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
