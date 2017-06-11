class Public::TabsController < Public::PublicController

  layout 'public/tabs/preview', only: :preview

  def show
    @artist = Artist.active.friendly.find(params[:artist_id])
    @tab    = @artist.tabs.friendly.find(params[:id])
    get_tone_and_notation
    respond_to do |format|
      format.html { actions_for_display @artist, @tab }
      format.js {
        render 'change'
      }
    end
  end

  def vote
    @tab  = Tab.friendly.find(params[:id])
    @vote = @tab.votes.create(value: params[:value], user: current_user, ip: request.remote_ip)
    flash[:success] = t(:voted) if @vote.persisted?
    respond_to :js
  end

  def favorite
    @tab = Tab.friendly.find(params[:id])
    fav = @tab.favorites.find_by(user: current_user)
    if fav
      fav.delete
      @is_favorite = false
      #flash[:success] = t(:favorite_removed)
    else
      fav = @tab.favorites.create(user: current_user, artist: @tab.artist)
      @is_favorite = true
      #flash[:success] = t(:favorite_added)
    end
    respond_to :js
  end

  def old_url
    @tab = Tab.find_by!(old_slug: params[:id])
    @artist = @tab.artist
    @canonical = artist_tab_url(@artist, @tab)
    get_tone_and_notation
    actions_for_display @artist, @tab
    render 'show'
  end

  private

    def actions_for_display(artist, tab)
      @tabs = artist.tabs.active.order(visits_count: :desc).first(12)                           # Load Tabs
      @vote = tab.votes.find_by(ip: request.remote_ip) || tab.votes.find_by(user: current_user) # Load Vote
      @is_favorite = tab.favorites.find_by(user: current_user)                                  # Load Favorite
      tab.visits.create(artist: artist, user: current_user) unless robot?                       # Create Visit
    end

    def get_tone_and_notation
      @semitones = (params[:semitones] || 0).to_i
      @notation  = (params[:notation] || :latin).to_sym
      @content   = TranscriptionTranslator.new(@semitones, notation: @notation).call(@tab.content)
    end

    def robot?
      request.user_agent =~ /(Baidu|bot|Google|SiteUptime|Slurp|WordPress|ZIBB|ZyBorg)/i
    end

end