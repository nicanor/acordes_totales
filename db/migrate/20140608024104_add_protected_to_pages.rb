class AddProtectedToPages < ActiveRecord::Migration
  def change
    add_column :pages, :protected, :boolean, default: false
  end
end
