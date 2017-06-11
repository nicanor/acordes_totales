namespace :load do
  task artists: :environment do

    require 'open-uri'
    content = open("http://localhost:3001/api/artistas").read
    artists = JSON.parse(content)

    artists.each do |x|
      Artist.create(
        name: x['nombre'],
        slug: x['slug'],
        bio: x['biografia'],
        bio_source: x['fuente'],
        active: true
      )
    end

  end
end