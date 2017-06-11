class AddSearchIndexToArtists < ActiveRecord::Migration
  def up
    execute "create index artists_name on artists using gin(to_tsvector('spanish', name))"
  end

  def down
    execute "drop index artists_name"
  end
end