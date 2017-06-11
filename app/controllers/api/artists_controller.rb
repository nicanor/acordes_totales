class Api::ArtistsController < Api::ApiController

  def index
    artists = Artist.active.pluck(:name, :slug)
    render json: artists.map {|artist| {name: artist[0], url: api_artist_path(artist[1])}}
  end

  def show
    artist = Artist.active.friendly.find(params[:id])
    tabs = artist.tabs.map {|tab| {title: tab.title, url: api_artist_tab_path(artist, tab)}}
    render json: {
      name: artist.name,
      url: api_artist_path(artist),
      tabs: tabs
    }
  rescue
    render json: {status: 404}, status: 404
  end

end