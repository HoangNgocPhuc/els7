class WordsController < ApplicationController
  before_action :logged_in_user
  
  def index
    @words = Word.paginate(page: params[:page], per_page: Settings.words_per_page)
  end

  def show
    @word = Word.find_by(id: params[:id])
  end
end
