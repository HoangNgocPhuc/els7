class ChecksController < ApplicationController
  def create
    if params[:check].nil?
      current_lesson.update_attribute(:check, 1)
    else
      current_lesson.learned_words.each do |word|
        if(params[:check][word.id_to_string].present? && word.meaning == params[:check][word.id_to_string])
          result = current_lesson.find_result(word.id)
          result.update_attribute(:status, Settings.right_answer)
        end
      end
      current_lesson.update_attribute(:check, 1)
      flash[:success] = t("checks.done")
    end
    redirect_to current_lesson
  end
end
