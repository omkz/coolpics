class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::DateHelper
  include Devise::Controllers::Helpers
  
  attributes :id, :title, :image, :score, :created_at, :url, :is_liked
  belongs_to :user
  has_many :comments

  def url
    post_url(object)
  end

  def created_at
    time_ago_in_words(object.created_at)
  end   

  def is_liked
    scope.current_user.liked?(object)
  end
end
