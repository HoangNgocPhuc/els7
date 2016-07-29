class Admin::CateroriesController < ApplicationController
  before_action :logged_in_user
  before_action :find_category, only: [:show, :destroy]

  def index
    @categories = Caterory.all
  end

  def show
  end

  def new
    @category = Caterory.new
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

  def destroy
      
  end

  private

  def category_params
    params.require(:caterory).permit(:name)
  end

  def find_category
    @category = Caterory.find_by(id: params[:id])
  end
end
