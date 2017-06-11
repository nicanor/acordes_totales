class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.references :tab, index: true
      t.references :user, index: true
      t.string :ip

      t.timestamps
    end
  end
end
