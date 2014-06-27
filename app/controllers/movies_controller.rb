class MoviesController < ApplicationController
  respond_to :json, :html

# this makes it possible to filter ratings by type

  def index
    if params[:show_only]
      @movies = current_user.ratings.where(value: params[:show_only]).map{|r| r.movie}
    else
      @movies = Movie.all
    end
  end

  def update
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def rating_params
    params.require(:rating).permit(:value)
  end

end
