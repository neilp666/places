class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update]
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @places = Place.search(params[:search])
 
  end

  def show
    @review = Review.new
  end

  def new
    @place = Place.new
    respond_with(@place)
  end

  def edit
  end

  def create
    @place = current_user.places.new(place_params)
    @place.save
    respond_with(@place)
  end

  def update
    @place.update(place_params)
    respond_with(@place)
  end

  def destroy
    @place.destroy
    respond_with(@place)
  end

  private
    def set_place
      @place = Place.find(params[:id])
    end

    def place_params
      params.require(:place).permit(:name, :address, :description, :phone, :website)
    end
end
