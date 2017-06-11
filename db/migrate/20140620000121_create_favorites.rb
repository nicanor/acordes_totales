class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user, index: true
      t.references :tab, index: true
      t.references :artist, index: true
      t.integer :order

      t.timestamps
    end
  end
end
