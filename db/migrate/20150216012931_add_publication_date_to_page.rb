class AddPublicationDateToPage < ActiveRecord::Migration
  def change
    add_column :pages, :publication_date, :date
  end
end
