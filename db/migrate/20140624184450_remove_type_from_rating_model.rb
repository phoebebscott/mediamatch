class RemoveTypeFromRatingModel < ActiveRecord::Migration
  def change
    remove_column :ratings, :type, :string
  end
end
