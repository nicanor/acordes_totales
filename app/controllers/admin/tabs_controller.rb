class Admin::TabsController < Admin::AdminController

  before_action :set_tab, only: [:show, :update, :destroy]

  def show
  end

  def create
    @artist = Artist.friendly.find(params[:artist_id])
    @tab = @artist.tabs.build(tab_params)
    if @tab.save
      redirect_to [:admin, @tab], success: t(:created)
    else
      redirect_to [:admin, @artist], success: t(:failed)
    end
  end

  def update
    if @tab.update(tab_params)
      redirect_to [:admin, @tab], success: t(:updated)
    else
      render :edit
    end
  end

  def destroy
    @artist = @tab.artist
    @tab.destroy
    redirect_to [:admin, @artist], success: t(:deleted)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tab
      @tab = Tab.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tab_params
      params.require(:tab).permit(:title, :slug, :source, :content, :active, :revised)
    end
end
