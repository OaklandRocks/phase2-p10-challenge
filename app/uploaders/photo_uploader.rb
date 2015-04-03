require 'pry'


CarrierWave.configure do |config|
  # binding.pry
    config.root = APP_ROOT + 'public/'
    config.fog_credentials = {
        provider:                'AWS',
        aws_access_key_id:      ENV['AWS_S3_KEY_ID'],
        aws_secret_access_key:  ENV['AWS_SECRET_ACCESS_KEY'],
        region:                 'us-west-1',
        # ENV['AWS_S3_REGION'],
      }
      config.fog_directory  = 'turkeysandwhich'
      config.fog_public     = false
 end


class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
    # storage :file
    # binding.pry
    storage :fog


    process :resize_to_fill => [200, 240]

    # version :thumb do
    #   process :resize_to_fill => [150, 150]
    # end

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