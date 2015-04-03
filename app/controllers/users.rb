require 'pry'

#----------- SESSIONS -----------
get '/' do
  erb :index
end
get '/sessions/new' do
  # render sign-in page
  erb :'users/sign_in'
end

post '/sessions' do
  @user = User.find_by(username: params[:user][:username])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
   @error
   flash[:error] = "User Name and password please"
    redirect "/sessions/new"
  end
end

delete '/sessions/:id' do
  session.clear
  redirect '/users/new'
end

#----------- USERS -----------
get '/users/new' do
  erb :'users/sign_up'
end


post '/users' do
  # binding.pry
  p params
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    redirect '/users/new'
  end
end


get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end


