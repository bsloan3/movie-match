post '/users/:id/reviews' do
  @movie = Movie.new(movie_title: params[:movie][:name])
  if @movie.save
    @review = Review.new(user_id: current_user.id, movie_id: Movie.last.id, review: params[:movie][:review], score: params[:movie][:score])
    if @review.save
      redirect "/users/#{current_user.id}"
    else
      @error = "Sorry, something went wrong with your review."
      @user = User.find_by(id: params[:id])
      erb :"/movies/index"
    end
  else
    @error = "Sorry, something went wrong with your review."
    @user = User.find_by(id: params[:id])
    erb :"/movies/index"
  end
end

delete '/users/:user_id/reviews/:id' do
  review = Review.find_by(id: params[:review_id])
  review.destroy!
  redirect "/users/#{current_user.id}"
end
