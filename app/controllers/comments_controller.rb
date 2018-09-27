class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @post = Post.friendly.find(params[:post_id])
    @post.comments.create(comment_params) do |post|
      post.user = current_user
    end
    redirect_to post_path(@post)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
