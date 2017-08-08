module Api::V1
  class ApiController < ActionController::API
    respond_to :json

    private

    def current_user
      @current_user ||= User.find(doorkeeper_token[:resource_owner_id])
    end
  end
end