class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: [:edit, :update, :destroy]


  #edit reference to the set_review 
  def edit
  end

  def create
    @review = current_user.reviews.new(review_params)
    
    respond_to do |format|
      if @review.save
          format.html { redirect_to place_path(@review.place), notice: 'Review was saved' }
      else
          format.html { redirect_to place_path(@review.place), notice: 'Something went wrong' }
      end
    end
  end

  def update

    respond_to do |format|
      if @review.save
          format.html { redirect_to place_path(@review.place), notice: 'Review was saved' }
      else
          format.html { redirect_to place_path(@review.place), notice: 'Something went wrong' }
      end
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
    params.require(:review).permit(:content, :place_id, :score)
  end





end


