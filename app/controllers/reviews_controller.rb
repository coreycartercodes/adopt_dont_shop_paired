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
    if @shelter.save
      redirect_to "/shelters/#{@shelter.id}"
    else
      flash[:alert] = "Title, rating, and content required to continue!"
      redirect_to "/shelters/#{@shelter.id}/review"
    end
  end

  def review_params
    params.permit(:title, :rating, :content, :image)
  end

  def edit
    @review = Review.find(params[:id])
    @shelter = @review.shelter
  end

  def update
    @review = Review.find(params[:id])
    @shelter = @review.shelter
    @review.update({title: params[:title], rating: params[:rating], content: params[:content], image: params[:image]})
    @review.save
    redirect_to "/shelters/#{@shelter.id}"
  end
  #
  # #
  # def destroy
  #   Review.destroy(params[:id])
  #   redirect_to '/shelters'
  # end


end
