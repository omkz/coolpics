class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::DateHelper

  attributes :id, :title, :image, :created_at, :url
  belongs_to :user
  has_many :comments

  def url
    post_url(object)
  end

  def created_at
    time_ago_in_words(object.created_at)
  end
    
end
