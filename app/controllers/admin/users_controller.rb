class Admin::UsersController < Admin::AdminController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def update
    if @user.update(user_params)
      redirect_to [:admin, @user], success: t(:updated)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to [:admin, :users], success: t(:deleted)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :activation_state, :password)
    end
end
