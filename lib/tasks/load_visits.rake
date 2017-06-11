namespace :load do
  task visits: :environment do

    require 'open-uri'

    Artist.all.each do |artist|
      content = open("http://localhost:3001/api/artistas/#{artist.slug}/tablaturas").read
      tabs    = JSON.parse(content)

      puts artist.name
      tabs.each do |tab|
        local_tab = artist.tabs.find_by(old_slug: tab['slug'])
        Math.log2(tab['visitas_count']).round.times do
          local_tab.visits.create
        end
      end
    end

  end
end