class CreateProspectCards < ActiveRecord::Migration
  def change
    create_table :prospect_cards do |t|
      t.string :name
      t.string :is_a
      t.string :looking_for
      t.text :description

      t.timestamps
    end
  end
end
