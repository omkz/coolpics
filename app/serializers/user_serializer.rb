class UserSerializer < ActiveModel::Serializer
  include Devise::Controllers::Helpers
  attributes :id, :username, :email, :avatar, :user_signed_in

  def user_signed_in
    scope.user_signed_in? 
  end
end
