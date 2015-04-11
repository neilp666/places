class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: [:edit, :update, :destroy]


  #edit reference to the set_review 
  def edit
  end

  def create
    @review = current_user.reviews.new(review_params)
    
    if @review.save
      respond_with(place_path(@review.place))
    else
      respond_to place_path(@review.place)
    end

  end

  def update
    if  @review.update(review_params)
    respond_with(place_path(@review.place))
    else 
      respond_to place_path(@review.place)
    end
  end
    
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to place_apth(@review.place), notice: 'Review was successfully destroyed'}
    end
   end

  private


  # Find the review

  def set_review
    @review = Review.find.params[:id]
  end

  # The attributes of the review
  # params - the actual attributes 

  def review_params
    params.require(:review).permit(:content, :place_id)
  end





end


