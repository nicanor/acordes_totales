class Public::RegisterController < Public::PublicController

  def submit
    @user = User.new permitted_params
    @user.role = 'registered_user'
    if @user.save
      UserMailer.activation_needed_email(@user).deliver
      redirect_to root_path, success: t(:registered)
    else
      flash[:warning] = t(:register_error)
      render 'register'
    end
  end

  def register
    @user = User.new
  end

  private

  def permitted_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end