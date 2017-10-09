class Review < ActiveRecord::Base
  # Remember to create a migration!
  validates :user_id, :movie_id, { presence: true }
  belongs_to :user
  belongs_to :movie

end
