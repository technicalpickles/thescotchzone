class UsersController < Clearance::UsersController
  respond_to :html, :xml, :json, :mobile

  def index
    @users = User.ascend_by_screen_name
  end

  def show
    @user = User.find(params[:id])
  end
end
