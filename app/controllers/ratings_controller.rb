class RatingsController < ApplicationController
  wrap_parameters format: :json
  respond_to :json, :html
  before_filter :set_movie

  def index
    @ratings = Rating.all
    respond_with @ratings
  end

  def new
  end

  def create

    @rating = Rating.new(rating_params)
    @rating.user = current_user
    @rating.movie = @movie

    if @rating.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: @rating, status: :created }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    if @rating.update(rating_params)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render nothing: true, status: :no_content }
      end
    else
      respond_to do |format|
        format.html
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def rating_params
    params.require(:rating).permit(:value)
  end
end


