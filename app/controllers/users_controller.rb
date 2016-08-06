class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  before_action :load_user, only: [:show, :edit, :update]

  def index
    @users = User.paginate page: params[:page],
      per_page: Settings.users_per_page
  end

  def show
    @activities = @user.activities.paginate(page: params[:page],
      per_page: Settings.users_per_page)
  end

  private
  
  def load_user
    @user = User.find_by(id: params[:id])
  end
end
