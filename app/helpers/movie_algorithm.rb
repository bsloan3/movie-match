def output_array(matched_movies, release_era)
  if matched_movies.any?
    output_movies = []
    matched_movies.each do |movie|
      if release_era == "modern"
        if movie["release_date"] =~ /\A(2|199)/
          output_movies << movie
        end
      elsif release_era == "classic"
        if movie["release_date"] =~ /\A(19)/
          output_movies << movie
        end
      else
        output_movies << movie
      end
    end
  end
  return output_movies
end

def first_match(genre_one, review_matters)
  matched_movies = []
  while matched_movies.count < 7
    if genre_one == "Action" || "Comedy" || "Documentary" || "Drama" || "Romance" || "Thriller"
      current_page = rand(500)
    elsif genre_one == "Adventure" || "Animation" || "Crime" || "Family" || "Horror" || "Romance"
      current_page = rand(20)
    else
      break
    end
    movies = genre_search(genre_one).get_page(current_page)

    break if movies == nil

    count = 0
    until count == 20
      if review_matters == "True"
        if movies.results[count]["vote_count"] >= 10 && movies.results[count]["vote_average"] >= 7 && movies.results[count]["original_language"] == "en"
          matched_movies << movies.results[count]
        end
      elsif movies.results[count]["vote_count"] >= 10 && movies.results[count]["vote_average"] >= 3 && movies.results[count]["original_language"] == "en"
        matched_movies << movies.results[count]
      end
      count += 1
    end
  end
  return matched_movies
end

def second_match(matched_movies, genre_two, review_matters)
  while matched_movies.count < 10
    if genre_two == "Action" || "Comedy" || "Documentary" || "Drama" || "Romance" || "Thriller" || "Horror"
      current_page = rand(500)
    elsif genre_two == "Adventure" || "Animation" || "Crime" || "Family" || "Horror" || "Romance"
      current_page = rand(20)
    else
      break
    end
    movies = genre_search(genre_two).get_page(current_page)

    break if movies == nil

    count = 0
    until count == 20
      if review_matters == "True"
        if movies.results[count]["vote_count"] >= 10 && movies.results[count]["vote_average"] >= 7 && movies.results[count]["original_language"] == "en"
          matched_movies << movies.results[count]
        end
      elsif movies.results[count]["vote_count"] >= 10 && movies.results[count]["vote_average"] >= 3 && movies.results[count]["original_language"] == "en"
        matched_movies << movies.results[count]
      end
      count += 1
    end
  end
  return matched_movies
end
