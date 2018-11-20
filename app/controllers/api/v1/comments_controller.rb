module Api::V1
  class CommentsController < ApiController
    # before_action :authenticate_user!, only: [:create]
    #before_action :doorkeeper_authorize!
    before_action :set_post, only: [:create]

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

    swagger_api :create do
      summary 'Create a comment for a post'
      notes 'Create a comment for a post by passing post id'
      param :query, :access_token, :string, :required, 'Authentication token'
      param :path, :post_id, :integer, :required, "ID of Post"
      param :form, :body, :text, :required, "Body of Comment"
      response :ok, "Success", :Comment
      response :unauthorized
      response :not_acceptable
      response :not_found
    end

    def create
      comment = @post.comments.build(comment_params.merge(user_id: current_user.id))
      if comment.save
        render json: comment, status: 201
      else
        render json: { errors: comment.errors.full_messages }, status: 422
      end
    end

    private

    def set_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.permit(:body, :post_id)
    end

  end
end