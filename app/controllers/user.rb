# create new user
get '/users/new' do

  erb :'users/new'
end

post '/users' do
  # puts params[:user]
  @user = User.new(params[:user])
  if @user.save
    redirect "/"
  else
    @errors = "Nope, try again."
    erb :"/users/new"
  end
end

get '/users' do
  @user = User.find_by(email: params[:user][:email])
  if @user
    redirect "/users/#{@user.id}"
  else
    @error = "user email does not exist"
    erb :"/movies/index"
  end
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  @reviews = Review.where(user_id: params[:id])

  erb :'users/show'
end
