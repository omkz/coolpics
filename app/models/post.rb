class Post < ActiveRecord::Base
  acts_as_votable
  mount_uploader :image, PictureUploader
  belongs_to :user
  
  validates :title, :image, presence: true

  def score
  	self.get_upvotes.size - self.get_downvotes.size
  end
  
end
