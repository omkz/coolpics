class Post < ActiveRecord::Base
  extend FriendlyId

  acts_as_votable
  mount_uploader :image, PictureUploader
  belongs_to :user
  
  validates :title, :image, presence: true

  friendly_id :title, use: :slugged

  def score
  	self.get_upvotes.size - self.get_downvotes.size
  end
  
end
