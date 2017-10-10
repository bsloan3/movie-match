get '/users/:id/results' do
  @genre_one = params[:movie][:genre_one]
  @genre_two = params[:movie][:genre_two]
  @review_matters = params[:movie][:review]
  @matched_movies = []
  binding pry

  while @matched_movies.count < 7
    if @genre_one == "Action" || "Comedy" || "Documentary" || "Drama" || "Romance" || "Thriller"
      @current_page = rand(500)
    else
      @current_page = rand(20)
    end
    @movies = genre_search(@genre_one).get_page(@current_page)
    count = 0
    until count == 20
      if @review_matters == "True"
        if @movies.results[count]["vote_average"] >= 7 && @movies.results[count]["original_language"] == "en"
          @matched_movies << @movies.results[count]
        end
      elsif @movies.results[count]["original_language"] == "en"
        @matched_movies << @movies.results[count]
      end
      count += 1
    end
  end

  while @matched_movies.count < 10
    if @genre_one == "Action" || "Comedy" || "Documentary" || "Drama" || "Romance" || "Thriller" || "Horror"
      @current_page = rand(500)
    else
      @current_page = rand(20)
    end
    @movies = genre_search(@genre_two).get_page(@current_page)
    count = 0
    until count == 20
      if @review_matters == "True"
        if @movies.results[count]["vote_average"] >= 7 && @movies.results[count]["original_language"] == "en"
          @matched_movies << @movies.results[count]
        end
      elsif @movies.results[count]["original_language"] == "en"
        @matched_movies << @movies.results[count]
      end
      count += 1
    end
  end

  erb :'results/index'
end
