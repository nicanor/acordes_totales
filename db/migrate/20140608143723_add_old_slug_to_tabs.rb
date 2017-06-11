class AddOldSlugToTabs < ActiveRecord::Migration
  def change
    add_column :tabs, :old_slug, :string
  end
end
