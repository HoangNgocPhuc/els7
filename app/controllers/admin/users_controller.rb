class Admin::UsersController < ApplicationController
  before_action :access_admin, :logged_in_user
 
  def index
    @user = User.find_by(id: params[:id])
    @users = User.paginate page: params[:page],
      per_page: Settings.users_per_page
  end
 
  def destroy
    @user = User.find_by(id: params[:id])
    if @user.destroy
      flash[:success] = t("user.delete")
    else
      flash[:danger] = t("user.delete_fail")
    end
    redirect_to admin_users_path
  end
end
