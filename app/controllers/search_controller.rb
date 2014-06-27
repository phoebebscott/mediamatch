class SearchController < ApplicationController
  respond_to :json, :html

# this sets the movie to the one that has been retrieves from a RT search

  def show
    @movie = Search.party(params[:movie])
    @rating = Rating.new
  end



end
