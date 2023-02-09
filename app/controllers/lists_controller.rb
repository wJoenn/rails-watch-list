class ListsController < ApplicationController
  def index
    @lists = List.all
    @show_list_form = params[:list_form]
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new(list_id: @list.id)
    @show_bookmark_form = params[:bookmark_form]
    @review = Review.new
    @reviews = @list.reviews
    @to_time = Time.now
  end

  def create
    list = List.new(list_params)
    if list.save
      redirect_to lists_path
    else
      redirect_to lists_path(list_form: 'true')
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :cover_url)
  end
end
