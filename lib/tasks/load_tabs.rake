namespace :load do
  task tabs: :environment do

    require 'open-uri'

    Artist.all.each do |artist|
      content = open("http://localhost:3001/api/artistas/#{artist.slug}/tablaturas").read
      tabs    = JSON.parse(content)

      puts artist.name
      tabs.each do |tab|
        tab['user'] = User.find_by(slug: tab['user']) if tab['user']
        tab['active'] = true
        artist.tabs.create(tab)
      end
    end

  end
end