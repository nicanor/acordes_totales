class Me::TabsController < Me::MeController

  before_action :load_tab, only: [:show, :update]

  def new
    @tab = Tab.new
  end

  def show
  end

  def create
    @tab = @me.tabs.create tab_params
    redirect_to [:me, @tab], success: t(:created)
  end

  def update
    @tab.update(tab_params)
    redirect_to me_root_path, success: t(:updated)
  end

  private

  def load_tab
    @tab = @me.tabs.friendly.find(params[:id])
  end

  def tab_params
    params.require(:tab).permit(:title, :content, :artist_id)
  end

end