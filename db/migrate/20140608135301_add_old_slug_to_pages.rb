class AddOldSlugToPages < ActiveRecord::Migration
  def change
    add_column :pages, :old_slug, :string
  end
end
