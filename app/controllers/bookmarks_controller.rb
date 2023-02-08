class BookmarksController < ApplicationController
  def create
    bookmark = Bookmark.new(bookmark_params)
    if bookmark.save
      redirect_to list_path(bookmark.list)
    else
      redirect_to list_path(bookmark.list, bookmark_form: 'true')
    end
  end

  def destroy
    bookmark = Bookmark.find(params['id'])
    list = bookmark.list
    redirect_to list_path(list)
    bookmark.destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:list_id, :movie_id, :comment)
  end
end
