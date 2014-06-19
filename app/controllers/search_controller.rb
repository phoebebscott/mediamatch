class SearchController < ApplicationController

  def show
    @movie = Search.party(params[:movie])
  end


end
