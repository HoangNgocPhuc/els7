class Admin::WordsController < ApplicationController
  before_action :logged_in_user
  before_action :find_word, only: [:show, :edit, :update, :destroy]

  def index
    @words = Word.paginate(page: params[:page], per_page: Settings.words_per_page)
  end

  def show
  end

  def new
    @word = Word.new
  end

  def edit
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      flash[:success] = t("flash.success_created")
      redirect_to [:admin, @word]
    else
      flash.now[:danger] = t("flash.create_failed")
      render :new
    end
  end

  def update
    @word = Word.find_by(id: params[:id])
    if @word.update_attributes(word_params)
      flash[:success] = t("word.update_success")
      redirect_to admin_words_path
    else
      flash.now[:danger] = t("word.update_failed")
      render :edit
    end
  end

  def destroy
    if @word.destroy
      flash[:success] = t("word.destroy")
    else
      flash[:danger] = t("word.destroy_failed")
    end
    redirect_to admin_words_path
  end

  private

  def word_params
    params.require(:word).permit(:learning_word, :meaning, :caterory_id)
  end

  def find_word
    @word = Word.find_by(id: params[:id])
  end
end
