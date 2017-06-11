class Public::ArtistsController < Public::PublicController

  def index
    @artists = Artist.active.page(params[:page]).per(10)
  end

  def show
    @artist = Artist.active.friendly.find(params[:id])
    @tabs = @artist.tabs.active.order(:title)
    @artist_popular_tabs = @artist.tabs.active.order(visits_count: :desc).first(12) #TODO grab popular tabs
  end

end