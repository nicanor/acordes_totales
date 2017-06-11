class AddVotesCountToTabs < ActiveRecord::Migration
  def change
    add_column :tabs, :votes_count, :integer, default: 0
  end
end
