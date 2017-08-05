class User < ApplicationRecord
  has_many :posts
  has_many :active_relationships, class_name:  "Relationship",
           foreign_key: "follower_id",
           dependent:   :destroy

  has_many :passive_relationships, class_name:  "Relationship",
           foreign_key: "followed_id",
           dependent:   :destroy

  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships

  has_many :recipents, class_name: "User",
            foreign_key: "recipent_id",
            dependent:   :destroy

  has_many :senders, class_name: "User",
            foreign_key: "follower_id",
            dependent:   :destroy

  has_many :comments

  validates :username, presence: true, uniqueness: true, length: {minimum: 3, maximum: 17}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  acts_as_voter
  mount_uploader :avatar, AvatarUploader

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = Devise.friendly_token[0,15]
    end
  end

  #omenk.follow(paijo)
  #relationship.create()
  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
    # notify(recipent, 'follow')
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
    # notify(recipent, 'unfollow')
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  # def notify(recipent, message)
  #   Notification.create(recipent_id: 1, sender_id: current_user, message: "A #{message} ki has been created", is_read: false)
  # end

end
