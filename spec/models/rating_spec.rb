require 'rails_helper'

RSpec.describe Rating, :type => :model do
  it { should belong_to(:user) }
  it { should belong_to(:movie) }

  it "is not a valid rating without a value between -1 and 1" do
    rating = Rating.new(movie_id: 1, user_id: 1, value: 2)
    expect(rating).to be_invalid
  end

  it "is not a valid rating without a value" do
    rating = Rating.new(movie_id: 1, user_id: 1, value: nil)
    expect(rating).to be_invalid
  end

  it "is not a valid rating without a user_id" do
    rating = Rating.new(user_id: nil, movie_id: 1, value: 1)
    expect(rating).to be_invalid
  end

  it "is not a valid rating without a movie_id" do
    rating = Rating.new(movie_id: nil, user_id: 1, value: 1)
    expect(rating).to be_invalid
  end
end
