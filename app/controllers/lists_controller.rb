class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(review_params)
    @list.save
    redirect_to lists_path
  end


  private

  def review_params
    params.require(:list).permit(:name)
  end
end
