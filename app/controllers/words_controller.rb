class WordsController < ApplicationController
  before_action :logged_in_user
  
  def index
    @caterories = Caterory.all
    word_type = params[:word_type] || Settings.all_words
    @words = Word.send(word_type, current_user)
     .by_caterory(params[:by_caterory])
     .paginate page: params[:page], per_page: Settings.words_per_page
  end

  def show
    @word = Word.find_by(id: params[:id])
  end
end
