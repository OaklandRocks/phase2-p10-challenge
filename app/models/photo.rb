class Photo < ActiveRecord::Base
  belongs_to :album
  mount_uploader :path, PhotoUploader

  validates :album_id, presence: true
  validates :path, presence: true
end



# class Photo < ActiveRecord::Base
#   mount_uploader :filename, PhotoUploader
#   belongs_to :album

#   validates :album_id, presence: true
#   validates :filename, presence: true
# end
