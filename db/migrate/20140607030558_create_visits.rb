class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.references :tab, index: true
      t.references :artist, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
