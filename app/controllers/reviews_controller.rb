class ReviewsController < ApplicationController
  def create
    review = Review.create(review_params)
    redirect_to list_path(review.list)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating).merge(list_id: params[:list_id])
  end
end
