class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :slug
      t.text :bio
      t.string :bio_source
      t.string :photo_uid
      t.string :photo_name
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
