class Me::MeController < ApplicationController

  before_filter :require_login, :load_me, :load_all

  def root
    @my_tabs = @me.tabs
  end

  def settings
  end

  def update
    @me.update(advocate_params)
    redirect_to me_root_path, success: t(:updated)
  end

  private

  def load_me
    @me = current_user
  end

  def load_all
    @artists = Artist.active.limit(10)
    @tabs    = Tab.active.includes(:artist).order(votes_count: :desc).limit(8)
  end

  def advocate_params
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :birth_date, :nationality, :photo, :remove_photo, :about)
  end

end