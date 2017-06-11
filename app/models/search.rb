class Search
  include ActiveModel::Model

  attr_accessor :artists, :tabs, :query
  validates :query, presence: true

  def start
    @artists = artist_search
    @tabs    = tab_search
  end

  def filter
    artists = if @query
      artist_search.order(visits_count: :desc)
    else
      Artist.order(visits_count: :desc)
    end
  end

  def artist
    return @artists.active.first if @artists.active.count == 1 && @tabs.empty?
    false
  end

  def tab
    return @tabs.first if @tabs.count == 1 && @artists.empty?
    false
  end

  private

  def artist_search
    Artist.active.where("to_tsvector('spanish', name) @@ plainto_tsquery('spanish', :q)", q: @query)
    #Artist.where("name ILIKE :q", q: '%'+@query+'%')
  end

  def tab_search
    Tab.where("to_tsvector('spanish', title) @@ plainto_tsquery('spanish', :q)", q: @query)
    #Tab.where("title ILIKE :q", q: '%'+@query+'%')
  end

end