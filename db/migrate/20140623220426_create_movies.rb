class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
    t.string   "rt_id"
    t.string   "title"
    t.string   "poster"

    t.timestamps
    end
  end
end
