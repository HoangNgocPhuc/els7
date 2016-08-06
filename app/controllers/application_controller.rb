class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include LessonsHelper
  private

  def access_admin
    unless current_user.admin?
      flash[:danger] = t("user.access_admin")
      redirect_to root_url
    end
  end

  def logged_in_user
    unless user_signed_in?
      store_location
      flash[:danger] = t("flash.danger")
      redirect_to login_url
    end
  end
end
