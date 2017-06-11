class AddTabCounterToArtist < ActiveRecord::Migration
  def up
    add_column :artists, :tabs_count, :integer, default: 0
    Artist.ids.each do |artist_id|
      Artist.reset_counters(artist_id, :tabs)
    end
  end

  def down
    remove_column :artists, :tabs_count
  end
end
