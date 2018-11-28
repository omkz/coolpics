module Api::V1
  class LikesController < ApiController
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token, :only => [:like, :unlike]
    
    def like
      @post = Post.friendly.find(params[:id])
      @post.liked_by current_user
      render json: @post
    end
  
    def unlike
      @post = Post.friendly.find(params[:id])
      @post.unliked_by current_user
      render json: @post
    end 
  end
  
end