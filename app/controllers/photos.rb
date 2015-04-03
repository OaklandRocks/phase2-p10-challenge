require 'pry'
post '/photo' do
# binding.pry
  @album = Album.where(id: params[:album_id]).first
  @photo = @album.photos.build #create photo at new instance of activerecord association
  @photo.path = params[:path]
  # p @photo
  # p @photo.path
  if @photo.save
    redirect "/albums/#{@album.id}"
    # p "#{@album.id}"
  else
    flash[:error] = "Dude select a photo to upload"
    redirect ("/albums/#{@album.id}")
  end
end

get '/photo/:id' do
  @photo = Photo.find(params[:id])
  @display_photo = @photo.path
  erb :'indivdual_photo'
end

delete '/photo/:id' do
  @photo = Photo.find(params[:id])
  @photo.destroy
  redirect "/albums/#{@photo.album_id}"
end




# post '/photo' do
#   album = Album.where(id: params[:album_id]).first
#     @photo = album.photos.build
#     @photo.path = params[:path]
#     if @photo.save
#       redirect "/albums/#{album.id}"
#       p "#{album.id}"
#     else
#       erb :'/albums/show'
#     end
# end