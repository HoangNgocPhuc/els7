class LessonsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find_by(id: params[:id])
    @words = @lesson.learned_words
  end

  def create
    @lesson = current_user.lessons.build(caterory_id: params[:caterory_id])
    if @lesson.save
      redirect_to @lesson
    end
  end
end
