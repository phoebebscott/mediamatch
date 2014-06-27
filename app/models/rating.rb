class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  validates_presence_of :movie
  validates_inclusion_of :value, :in => -1..1
end
