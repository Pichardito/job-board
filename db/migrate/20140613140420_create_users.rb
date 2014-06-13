class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.integer :uid
      t.string :name
      t.text :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end
end
