class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)
    @list.save

    redirect_to list_path(@list)
  end

  def new
    @list = List.new
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
