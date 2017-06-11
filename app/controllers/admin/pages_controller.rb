class Admin::PagesController < Admin::AdminController

  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
    @page  = Page.new
    @pages = Page.ordered
  end

  def show
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to [:admin,  @page], success: t(:created)
    else
      redirect_to [:admin, :pages], success: t(:failed)
    end
  end

  def update
    if @page.update(page_params)
      redirect_to [:admin, @page], success: t(:updated)
    else
      render :edit
    end
  end

  def destroy
    if @page.destroy
      redirect_to [:admin, :pages], success: t(:deleted)
    else
      redirect_to [:admin, @page], danger: t(:delete_error)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :slug, :old_slug, :description, :content, :protected, :publication_date)
    end
end
