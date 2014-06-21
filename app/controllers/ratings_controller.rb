class RatingsController < ApplicationController
  before_action :set_rating
  respond_to :json, :html

  def index
    @ratings = current_user.ratings.all
    respond_with @ratings
  end

  def new
    @rating = Rating.new
  end

  def create

    @rating = current_user.ratings.new(rating_params)

  # pull in json to save the rating
      if @rating.save
        respond_to do |format|
          format.json { render json: @rating, status: :created }
        end
      else
        respond_to do |format|
          format.json { render json: @rating.errors, status: :unprocessable_entity }
        end
      end
  end

protected

def set_rating
  @rating = current_user.ratings.find(params[:id])
  def rating_params
    params.require(:rating).permit(:value)
  end

end
