class Admin::ArtistsController < Admin::AdminController

  before_action :set_artist, only: [:show, :edit, :update, :destroy, :remove_visits]

  def index
    @artist  = Artist.new
    search = Search.new(query: params[:name])
    @artists = search.filter.page(params[:page]).per(10)
  end

  def show
    @tab  = Tab.new
    @tabs = @artist.tabs.order(:title)
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to [:admin, @artist], success: t(:created)
    else
      redirect_to [:admin, :artists], success: t(:failed)
    end
  end

  def update
    if @artist.update(artist_params)
      redirect_to [:admin, @artist], success: t(:updated)
    else
      render :edit
    end
  end

  def remove_visits
    @artist.visits.delete_all
    redirect_to [:admin, @artist]
  end

  def destroy
    @artist.destroy
    redirect_to [:admin, :artists], success: t(:deleted)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_params
      params.require(:artist).permit(:name, :slug, :active, :bio, :bio_source, :photo, :photo_uid, :photo_name, :remove_photo)
    end
end
