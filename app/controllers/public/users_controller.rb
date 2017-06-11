class Public::UsersController < Public::PublicController

  def show
    @user = User.friendly.find(params[:id])
  end

end