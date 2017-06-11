class Public::LoginController < Public::PublicController

  def create
    #render json: env['omniauth.auth'].to_yaml
    user = UserCreator.new(env['omniauth.auth']).call
    auto_login(user)
    if logged_in?
      redirect_to me_root_path, success: t(:logged_in)
    else
      flash[:warning] = t(:invalid_credentials)
      render 'log_in'
    end
  end

  def submit
    @login_form = LoginForm.new permitted_params

    login @login_form.email, @login_form.password

    if logged_in?
      redirect_to me_root_path, success: t(:logged_in)
    else
      flash[:warning] = t(:invalid_credentials)
      render 'log_in'
    end
  end

  def log_in
    @login_form = LoginForm.new
  end

  def log_out
    logout
    redirect_to login_path, success: t(:logged_out)
  end

  private

  def permitted_params
    params.require(:login_form).permit(:email, :password)
  end

  def auth_params
    params.permit(:code, :provider)
  end

end