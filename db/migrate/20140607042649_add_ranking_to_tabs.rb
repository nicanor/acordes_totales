class AddRankingToTabs < ActiveRecord::Migration
  def change
    add_column :tabs, :ranking, :decimal, precision: 4, scale: 2, default: 0
  end
end
