def title_search(title)
  puts "ENV~~~~~~~~~~~~ #{ENV["API_KEY"]} ~~~~~~~~~~~~~~~"
  Tmdb::Api.key(ENV["API_KEY"])
  Tmdb::Api.language("en")
  Tmdb::Movie.find(title)

end

def genre_search(genre)
  puts "ENV~~~~~~~~~~~~ #{ENV["API_KEY"]} ~~~~~~~~~~~~~~~"
  Tmdb::Api.key(ENV["API_KEY"])
  Tmdb::Api.language("en")
  Tmdb::Genre.find(genre)
end
