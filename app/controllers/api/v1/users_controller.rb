module Api::V1
    class UsersController < ApiController
      swagger_controller :user, 'User'
  
      swagger_api :index do
        summary 'Fetches all User'
        notes 'This lists all the user order by time DESC'
      end
  
      def index
        @users = User.all
        render json: @users
      end
  
    end
  end