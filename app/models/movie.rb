class Movie < ActiveRecord::Base
  # Remember to create a migration!
  validates :movie_title, { presence: true, uniqueness: true }
  has_many :reviews

end
