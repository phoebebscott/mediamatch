class SearchController < ApplicationController
  respond_to :json, :html

  def show
    @movie = Search.party(params[:movie])
  end


end