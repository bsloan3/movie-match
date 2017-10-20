# home log in page
get '/' do

  erb :index
end

# log in
post '/login' do
  @user = User.find_by(email: params[:user][:email])

  if User.authenticate(params[:user][:email], params[:user][:password])
    session[:user_id]  = @user.id
    redirect "/users/#{@user.id}/movies"
  else
    @errors = "Nope, try again."
    erb :index
  end
end

# log out
get '/logout' do
  session.clear
  redirect "/"
end

# https://github.com/ahmetabdi/themoviedb
