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

get '/users/:id' do
  @reviews = Review.where(user_id: current_user.id)

  erb :'users/show'
end
