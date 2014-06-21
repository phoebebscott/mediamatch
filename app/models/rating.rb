class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
end

class upRating < Rating
  def value
    1
  end
end

class downRating < Rating
  def value
    -1
  end
end

class skipRating < Rating
  def value
    0
  end
end

class saveRating < Rating
end
