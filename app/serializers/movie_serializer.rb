class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :poster
  has_many :ratings
end
