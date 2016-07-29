class LessonsController < ApplicationController
  before_action :logged_in_user
  
  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find_by(id: params[:id])
  end

  def create
    @lesson = current_user.lessons.build(caterory_id: params[:caterory_id])
    if @lesson.save
      redirect_to @lesson
    else
      flash[:danger] = t("flash.failed_lesson")
      redirect_to caterories_url
    end
  end
end
