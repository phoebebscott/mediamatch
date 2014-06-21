class Movie < ActiveRecord::Base
  has_many :ratings, through: :users
  def self.party(movie)
    movie ||= "matrix"

    auth = { query: { apikey: 'ba6a69g94k428ceab9kazh3d', q: movie}}
    # q = movie
    # page_limit = 1
    search_url = "http://api.rottentomatoes.com/api/public/v1.0/movies.json"

    response = HTTParty.get search_url, auth

    auth = { query: { apikey: 'ba6a69g94k428ceab9kazh3d' }}
    id = response["movies"][0]["id"]
    # id = '770672122'
    movie_url = "http://api.rottentomatoes.com/api/public/v1.0/movies/#{id}.json"

    response = HTTParty.get movie_url, auth
    response.parsed_response["movie"]
  end
end
