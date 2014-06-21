class MoviesController < ApplicationController
  respond_to :json, :html

  def show
    #request rottentomatoes api through model method, store response in @movie variable
    @searched_movie = Movie.party(params[:movie])
    respond_with @searched_movie
  end

  def create
    @movie = Movie.create(params.require(:movie).permit(:id, :title, :poster, :user_id, :value))
  end

end
