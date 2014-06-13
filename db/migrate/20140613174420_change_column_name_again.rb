class ChangeColumnNameAgain < ActiveRecord::Migration
  def change
    rename_column :prospect_cards, :isa, :title
  end
end
