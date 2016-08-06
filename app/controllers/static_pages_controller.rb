class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @activities = current_user.activities.paginate page: params[:page],
        per_page: Settings.activity_per_page
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
