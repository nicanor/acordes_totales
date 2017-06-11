namespace :load do
  task votes: :environment do

    require 'open-uri'

    Artist.all.each do |artist|
      content = open("http://localhost:3001/api/artistas/#{artist.slug}/tablaturas").read
      tabs    = JSON.parse(content)

      puts artist.name
      tabs.each do |tab|
        local_tab = artist.tabs.find_by(old_slug: tab['slug'])
        local_tab.votes.create(value: (tab['valoracion']/2).round*2, ip: '127.0.0.1')
      end
    end

  end
end