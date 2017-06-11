class AddUnaccentExtension < ActiveRecord::Migration
  def up
    execute "create extension unaccent"
    execute "CREATE TEXT SEARCH CONFIGURATION unaccent_spa ( COPY = pg_catalog.spanish )"
    execute "ALTER TEXT SEARCH CONFIGURATION unaccent_spa ALTER MAPPING FOR hword, hword_part, word WITH unaccent, spanish_stem"
  end

  def down
    execute "drop extension unaccent cascade"
  end
end
