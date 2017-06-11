class AddSearchIndexToTabs < ActiveRecord::Migration
  def up
    execute "create index tabs_title   on tabs using gin(to_tsvector('spanish', title))"
  end

  def down
    execute "drop index tabs_title"
  end
end