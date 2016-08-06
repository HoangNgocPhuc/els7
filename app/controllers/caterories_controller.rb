class CateroriesController < ApplicationController
  before_action :authenticate_user!
  load_resource
  authorize_resource except: [:index, :show]
  def index
    @categories = Caterory.all
  end

  def show
    @words = @category.words.paginate page: params[:page],
      per_page: Settings.words_per_page
  end

  def new
    @category = Caterory.new
  end

  def edit
  end

  def create
    @category = Caterory.new(category_params)
    if @category.save
      flash[:success] = t("flash.success_created")
      redirect_to [:admin, @category]
    else
      flash.now[:danger] = t("flash.create_failed")
      render :new
    end
  end

  def update
    if @category.update_attributes(word_params)
      flash[:success] = t("category.update_success")
      redirect_to [:admin, @category]
    else
      flash.now[:danger] = t("category.update_failed")
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t("category.destroy")
    else
      flash[:danger] = t("category.destroy_failed")
    end
    redirect_to admin_caterories_path
  end

  private

  def category_params
    params.require(:caterory).permit(:name)
  end

  def find_category
    @category = Caterory.find_by(id: params[:id])
  end
end
