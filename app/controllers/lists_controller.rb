class ListsController < ApplicationController
  def index
    @lists = List.all
    @show_list_form = params[:list_form]
  end

  def show
    @list = List.find(params[:id])

    # Bookmark form
    @bookmark = Bookmark.new(list: @list)
    @show_bookmark_form = params[:bookmark_form]

    # Review form
    @review = Review.new

    # Review index
    @reviews = @list.reviews
    @to_time = Time.now
  end

  def create
    list = List.new(list_params)
    if list.save
      redirect_to root_path
    else
      redirect_to root_path(list_form: 'true')
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :cover_url)
  end
end
