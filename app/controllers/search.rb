get '/users/:id/search' do
  @output_movies = title_search(params[:movie][:title])

  erb :'results/show'
end
