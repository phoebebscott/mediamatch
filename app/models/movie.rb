class Movie < ActiveRecord::Base
  has_many :ratings
  has_many :users, through: :ratings
  validates_presence_of :title
  validates_presence_of :rt_id
  validates_presence_of :poster
end
