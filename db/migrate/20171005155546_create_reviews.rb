class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id, :null => false
      t.integer :movie_id, :null => false
      t.integer :score, :null => false
      t.string :review, :null => false
      t.timestamps
    end
  end
end
