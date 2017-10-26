get '/users/:id/results' do
  unless params[:movie] && params[:movie][:genre_one] && params[:movie][:genre_two] && params[:movie][:released] && params[:movie][:review]
    @error = "please select all fields"
    erb :'movies/index'
  else
    @genre_one = params[:movie][:genre_one]
    @genre_two = params[:movie][:genre_two]
    @release_era = params[:movie][:released]
    @review_matters = params[:movie][:review]

    # first_match helper
    @matched_movies = first_match(@genre_one, @review_matters)

    # second_match helper
    @matched_movies = second_match(@matched_movies, @genre_two, @review_matters)

    # output_array helper
    @output_movies = output_array(@matched_movies, @release_era)

    if @output_movies.any?
      @output_movies.sort! { |x,y| y["vote_average"]<=>x["vote_average"] }
    end

    erb :'results/index'
  end
end
