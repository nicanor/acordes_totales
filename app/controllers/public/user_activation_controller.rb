class Public::UserActivationController < Public::PublicController

  def activate
    if @user = User.load_from_activation_token(params[:token])
      @user.activate!
      redirect_to login_path, success: t(:activated)
    else
      redirect_to register_path, warning: t(:invalid_action)
    end
  end

end