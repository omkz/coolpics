module Api::V1
    class PostsController < ApiController
      swagger_controller :home, 'Home'
  
      swagger_api :index do
        summary 'Fetches all Post'
        notes 'This lists all the post order by time DESC'
      end
  
      def index
        @posts = Post.includes(:comments)
        render json: @posts
      end
  
    end
  end