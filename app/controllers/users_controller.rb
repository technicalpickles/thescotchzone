class UsersController < Clearance::UsersController

  def index
    @users = User.ascend_by_screen_name
  end

  def show
    @user = User.find(params[:id])
  end
end
