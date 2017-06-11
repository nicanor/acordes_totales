class Admin::AdminController < ApplicationController

  before_filter :require_login, :require_admin

  def root
    @visit_count = Visit.count
    @vote_count  = Vote.count
    @tabs = Tab.popular.includes(:artist).first(50)
  end

  private

  def require_admin
    unless current_user.role == 'admin'
      redirect_to root_path, danger: t(:authorization_error) #TODO: add status not_authorized
    end
  end

end