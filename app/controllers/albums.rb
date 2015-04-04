require 'pry'

get '/albums/new' do
  erb :'albums/new'
end

post '/albums'  do
  # p "#{current_user.id}"
  user = User.find(current_user.id)
  new_album = user.albums.new(name: params[:name])
  if new_album.save
    redirect "/albums/#{new_album.id}"
  # else
  #   flash[:error] = new_album.errors.full_messages
  end
end
get '/albums/all' do
  @albums = Album.all
  erb :'albums/list'
end

get '/albums/:id' do
  # binding.pry
  p params
  @album = Album.find(params[:id])
  erb :'albums/show'
end

delete '/albums/:id' do
  @album = Album.find(params[:id])
  @album.destroy
  redirect '/albums/new'
end




# post '/albums'  do
#   user = User.find(session[:user_id])
#   new_album = user.albums.new(name: params[:name])
#   if new_album.save
#     redirect "/albums/#{new_album.id}"
#   end
# end

# get '/albums/new' do
#   erb :'albums/new'
# end

# get '/albums/all' do
#   @albums = Album.all
#   erb :'albums/list'
# end

# get '/albums/:id' do
#   @album = Album.find(params[:id])
#   erb :'albums/show'
# end