class AddRevisedToTabs < ActiveRecord::Migration
  def change
    add_column :tabs, :revised, :boolean, default: false
  end
end
