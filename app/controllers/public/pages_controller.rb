class Public::PagesController < Public::PublicController

  def index
    @pages = Page.published
  end

  def show
    @page = Page.friendly.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    begin
      @page = Page.find_by!(old_slug: params[:id])
      @canonical = page_url(@page)
    rescue ActiveRecord::RecordNotFound
      render '404', status: :not_found
    end
  ensure
    @prev = Page.published.where(["publication_date < ?", @page.publication_date]).last
    @next = Page.published.where(["publication_date > ?", @page.publication_date]).first
  end


end