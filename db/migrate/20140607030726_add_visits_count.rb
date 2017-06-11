class AddVisitsCount < ActiveRecord::Migration
  def change
    add_column :artists, :visits_count, :integer, default: 0
    add_column :tabs   , :visits_count, :integer, default: 0
    add_column :users  , :visits_count, :integer, default: 0
  end
end