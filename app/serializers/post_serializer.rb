class PostSerializer < ActiveModel::Serializer
  

  attributes :id, :title, :image
  has_many :comments

end
