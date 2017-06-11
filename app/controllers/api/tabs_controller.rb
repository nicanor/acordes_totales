class Api::TabsController < Api::ApiController

  def show
    artist = Artist.active.friendly.find(params[:artist_id])
    tab    = artist.tabs.friendly.find(params[:id])
    semitones = (params[:semitones] || 0).to_i
    notation  = (params[:notation] || :latin).to_sym
    content   = TranscriptionTranslator.new(semitones, notation: notation, response: :text).call(tab.content)

    render json: {
      title: tab.title,
      artist: artist.name,
      ranking: tab.ranking,
      content: content,
      links: [
        {
          rel: :self,
          url: api_artist_tab_path(artist, tab, params.slice(:semitones, :notation))
        },
        {
          rel: :artist,
          url: api_artist_path(artist)
        }
      ]
    }
  rescue
    render json: {status: 404}, status: 404
  end

end