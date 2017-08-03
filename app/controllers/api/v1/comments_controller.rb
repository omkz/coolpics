module Api::V1
  class CommentsController < ApiController
    swagger_controller :comments, 'Comments'

    swagger_api :index do
      summary 'Fetches all comments for a post'
      notes 'This lists all the comments by passing post id'
      param :path, :post_id, :integer, :required, "ID of Post"
      response :ok, "Success", :Comment
      response :unauthorized
      response :not_acceptable
      response :not_found
    end

    def index
      @post = Post.find(params[:post_id])
      render json: @post.comments
    end

  end
end