class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :movie_title, :null => false
      t.timestamps
    end
  end
end
