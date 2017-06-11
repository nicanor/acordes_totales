class Public::ResetPasswordController < Public::PublicController

  def forgot_password
  end

  def send_instructions
    @user = User.find_by_email(params[:user][:email])
    if @user
      @user.deliver_reset_password_instructions!
      redirect_to root_path, success: t(:instructions_sended)
    else
      redirect_to forgot_password_path, warning: t(:invalid_action)
    end
  end

  # This is the reset password form.
  def reset_password
    @token = params[:token]
    @user = User.load_from_reset_password_token(@token)

    if @user.blank?
      not_authenticated
      return
    end
  end

  # This action fires when the user has sent the reset password form.
  def submit
    @token = params[:token]
    @user = User.load_from_reset_password_token(@token)

    if @user.blank?
      not_authenticated
      return
    end

    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.change_password!(params[:user][:password])
      redirect_to(login_path, success: t(:password_updated))
    else
      render :action => "edit", warning: t(:invalid_action)
    end
  end

end