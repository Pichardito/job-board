class AddLinkedInAttributes < ActiveRecord::Migration
  def change
    add_column :users, :linkedin_email, :string
    add_column :users, :linkedin_profile_img, :string
  end
end
