module Api::V1
  class ApiController < ActionController::API
    include ActionController::RequestForgeryProtection
    protect_from_forgery with: :null_session
    serialization_scope :view_context
    respond_to :json
    

    # private

    # def current_user
    #   @current_user ||= User.find(doorkeeper_token[:resource_owner_id])
    # end
  end
end