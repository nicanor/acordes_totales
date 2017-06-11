class Public::SearchController < Public::PublicController

  def search
    @search = Search.new permitted_params
    @search.start
    artist, tab = @search.artist, @search.tab
    redirect_to artist if artist
    redirect_to [tab.artist, tab] if tab
    @search.tabs = @search.tabs.includes(:artist) # For faster DB loading.
  end

  def options
    # TODO: Load most popular
    render json: (Artist.limit(5).pluck(:name) + Tab.limit(5).pluck(:title))
  end

  def more_options
    # TODO: Except most popular (because they are already loaded)
    query = params[:q] || ''
    search = Search.new(query: query)#.search
    search.start
    render json: (search.artists.pluck(:name) + search.tabs.pluck(:title))
  end

  private

  def permitted_params
    params.require(:search).permit(:query)
  end

end