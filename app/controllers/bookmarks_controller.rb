class BookmarksController < ApplicationController
  def create
    bookmark = Bookmark.new(bookmark_params)
    bookmark.list = List.find(params[:list_id])
    if bookmark.save
      redirect_to list_path(bookmark.list)
    else
      redirect_to list_path(bookmark.list, bookmark_form: 'true')
    end
  end

  def destroy
    bookmark = Bookmark.find(params['id'])
    list = bookmark.list
    bookmark.destroy
    redirect_to list_path(list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
