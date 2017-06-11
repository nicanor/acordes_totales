class Public::PublicController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  before_action :load_all
  layout :set_layout

  def home
    @home = true
  end

  def sitemap
    @pages = Page.published.pluck(:slug)
    @artists = Artist.active
  end

  def chords
    @transpose = params[:transpose].to_i
  end

  def not_found
    render '404', status: :not_found
  end

  private

  def load_all
    @artists = Artist.active.limit(10)
    @tabs    = Tab.active.includes(:artist).order(votes_count: :desc).limit(8)
  end

end