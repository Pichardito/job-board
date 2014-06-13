class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :prospect_cards, :is_a, :isa
  end
end
