class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    # @bookmark = Bookmark.new(review_params)
    # @bookmark.list = @list
    @movie = Movie.find(params[:bookmark][:movie])
    @comment = params[:bookmark][:comment]
    @bookmark = Bookmark.new(list: @list, movie: @movie, comment: @comment)
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path, status: :see_other
  end

  private

  def review_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
