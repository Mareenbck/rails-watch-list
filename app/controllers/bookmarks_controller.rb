class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save!
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(@list)
  end

  def validate
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    @bookmark.update(status: true)
    redirect_to list_path(@list)
  end

  def unwatched
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    @bookmark.update(status: false)
    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :status)
  end
end
