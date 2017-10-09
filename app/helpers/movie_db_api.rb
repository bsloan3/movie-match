def title_search(title)
  Tmdb::Api.key("2f70af6d0463402e0b8e1e15f0af5457")
  Tmdb::Api.language("en")
  Tmdb::Movie.find(title)

end

def genre_search(genre)
  Tmdb::Api.key("2f70af6d0463402e0b8e1e15f0af5457")
  Tmdb::Api.language("en")
  Tmdb::Genre.find(genre)

end

def company_search(company)
  Tmdb::Api.key("2f70af6d0463402e0b8e1e15f0af5457")
  Tmdb::Api.language("en")
  Tmdb::Company.find(company)

end


def collection_search(collection)
  Tmdb::Api.key("2f70af6d0463402e0b8e1e15f0af5457")
  Tmdb::Api.language("en")
  Tmdb::Collection.find(collection)

end

# def keyword_search(movie)
#   Tmdb::Api.key("2f70af6d0463402e0b8e1e15f0af5457")
#   Tmdb::Api.language("en")
#   Tmdb::Movie.keywords(movie)

# end

# def release_search(movie)
#   Tmdb::Api.key("2f70af6d0463402e0b8e1e15f0af5457")
#   Tmdb::Api.language("en")
#   Tmdb::Movie.releases(movie)

# end
