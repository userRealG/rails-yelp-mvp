class ReviewsController < ApplicationController

  def new
    # we need @restaurant in our `simple_form_for`
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'restaurants/new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
