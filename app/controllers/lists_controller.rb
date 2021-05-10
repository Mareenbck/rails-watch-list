class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new # <-- You need this now.
    @bookmarks = @list.bookmarks
    @watched_bookmarks = @bookmarks.where(status: true)
    @unwatched_bookmarks = @bookmarks.where(status: false)
  end

  def new
     @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :tag_list)
  end
end
