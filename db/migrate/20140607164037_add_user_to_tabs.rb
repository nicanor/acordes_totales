class AddUserToTabs < ActiveRecord::Migration
  def change
    add_reference :tabs, :user, index: true
  end
end
