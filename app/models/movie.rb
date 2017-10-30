class Movie < ActiveRecord::Base
  # Remember to create a migration!
  validates :movie_title, { presence: true }
  has_many :reviews

end
