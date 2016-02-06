class Post < ActiveRecord::Base
  mount_uploader :image, PictureUploader
  belongs_to :user
  
  validates :title, :image, presence: true
end
