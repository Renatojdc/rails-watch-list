class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@bookmark.list), notice: 'Bookmark was successfully added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
