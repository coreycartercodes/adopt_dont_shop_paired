class ReviewsController < ApplicationController

  def new
    @shelter = Shelter.find(params[:id])
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    @shelter = Shelter.find(params[:id])
    @shelter.reviews.create(review_params)
    redirect_to "/shelters/#{@shelter.id}"
  end

  def review_params
    params.permit(:title, :rating, :content, :image)
  end
  #
  # def edit
  #   @review = Review.find(params[:id])
  # end
  #
  # def update
  #   review = Review.find(params[:id])
  #   review.update({name: params[:name], address: params[:address], city: params[:city], state: params[:state],zip: params[:zip]})
  #   review.save
  #   # redirect_to "/reviews/#{review.id}"
  # end
  #
  # #
  # def destroy
  #   Review.destroy(params[:id])
  #   redirect_to '/shelters'
  # end


end
