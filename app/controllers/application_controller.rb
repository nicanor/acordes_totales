class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger

  private

  def require_login
    flash[:warning] = t(:login_required) if !logged_in?
    super
  end

  def set_layout
    case request.user_agent
    when /iPhone/i, /Android/i && /mobile/i, /Windows Phone/i then "phone"
    #when /iPad/i, /Android/i then "tablet"
    else "application"
    end
  end

end