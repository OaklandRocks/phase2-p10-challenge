class Album < ActiveRecord::Base
  belongs_to :user
  has_many :photos

  validates :user_id, presence: true
  validates :name, presence: true
end


# class Album < ActiveRecord::Base
#   belongs_to :user
#   has_many :photos
#   # , dependent: :destroy
#   validates :user_id, presence: true
#   validates :title, presence: true
# end
