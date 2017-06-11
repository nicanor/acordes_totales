class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :nationality, :string
    add_column :users, :birth_date , :date
    add_column :users, :photo_uid  , :string
    add_column :users, :photo_name , :string
    add_column :users, :about      , :text
  end
end
