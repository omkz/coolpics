class Post < ApplicationRecord
  

  extend FriendlyId
  
  belongs_to :user

  has_many :comments, dependent: :destroy
  
  validates :title, :image, presence: true
  
  acts_as_votable

  mount_uploader :image, PictureUploader

  friendly_id :title, use: :slugged

  def score
    self.get_upvotes.size - self.get_downvotes.size
  end

  def self.search(query)
    where("title like ?", "%#{query}%") 
  end

end
