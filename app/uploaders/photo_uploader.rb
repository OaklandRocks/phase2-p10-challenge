class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
    storage :file
    # storage :fog


    process :resize_to_fill => [200, 240]

    version :thumb do
      process :resize_to_fill => [150, 150]
    end

  def store_dir
    'uploads/photos'
  end
end
# '/public/uploads/photos'



# class PhotoUploader < CarrierWave::Uploader::Base
#   include CarrierWave::MiniMagick
#   storage :file

#   process :resize_to_fit => [800, 800]

#   version :thumb do
#     process :resize_to_limit => [200, 200]
#   end

#   def extension_white_list
#     %w(jpg jpeg gif png ico)
#   end
# end