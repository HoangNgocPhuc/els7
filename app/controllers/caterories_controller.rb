class CateroriesController < ApplicationController
  before_action :logged_in_user

  def index
    @categories = Caterory.all
  end

  def show
    @category = Caterory.find_by(id: params[:id])
  end
end
