class BookmarksController < ApplicationController
  # As a user, I can bookmark a movie inside a movie list
  # As a user, I can destroy a bookmark

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    @movies = Movie.all
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      @movies = Movie.all
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    @bookmark.destroy
    redirect_to @list, status: :see_other
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
