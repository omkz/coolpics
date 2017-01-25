require 'elasticsearch/model'

class Post < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  extend FriendlyId


  acts_as_votable
  mount_uploader :image, PictureUploader
  belongs_to :user

  validates :title, :image, presence: true

  friendly_id :title, use: :slugged

  settings index: {number_of_shards: 1} do
    mappings dynamic: 'false' do
      indexes :title, analyzer: 'english', index_options: 'offsets'
    end
  end

  def score
    self.get_upvotes.size - self.get_downvotes.size
  end

  def self.search(query)
    __elasticsearch__.search(
        {
            query: {
                multi_match: {
                    query: query,
                    fields: ['title']
                }
            },
            highlight: {
                pre_tags: ['<em>'],
                post_tags: ['</em>'],
                fields: {
                    title: {}
                }
            }
        }
    )
  end

end


# Delete the previous posts index in Elasticsearch
Post.__elasticsearch__.client.indices.delete index: Post.index_name rescue nil

# Create the new index with the new mapping
Post.__elasticsearch__.client.indices.create \
  index: Post.index_name,
  body: { settings: Post.settings.to_hash, mappings: Post.mappings.to_hash }

# Index all post records from the DB to Elasticsearch
Post.import