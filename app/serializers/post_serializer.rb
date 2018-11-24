class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :image, :url
  belongs_to :user
  has_many :comments

  def url
    post_url(object)
  end

end
