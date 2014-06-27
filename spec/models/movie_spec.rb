require 'rails_helper'

RSpec.describe Movie, :type => :model do
  it { should have_many(:ratings)}
  it { should have_many(:users)}

  it "is not a valid movie without an rt_id" do
    movie = Movie.new(rt_id: nil, title: "Titanic", poster: "poster.jpg")
    expect(movie).to be_invalid
  end

  it "is not a valid movie without a title" do
    movie = Movie.new(title: nil, rt_id: 1234567, poster: "poster.jpg")
    expect(movie).to be_invalid
  end

  it "is not a valid movie without a poster" do
    movie = Movie.new(title: "Titanic", rt_id: 1234567, poster: nil)
    expect(movie).to be_invalid
  end
end
