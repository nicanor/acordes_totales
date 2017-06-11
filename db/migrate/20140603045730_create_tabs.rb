class CreateTabs < ActiveRecord::Migration
  def change
    create_table :tabs do |t|
      t.string :title
      t.string :slug
      t.string :tab_type, default: :chord
      t.text :content
      t.string :source
      t.references :artist, index: true
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
