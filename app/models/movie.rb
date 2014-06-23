class Movie < ActiveRecord::Base
  has_many :ratings
  has_many :users, through: :ratings

  def index
    @movies = Movie.all
    respond_with @movies
  end

  def new
  end

  def create
  end

end
