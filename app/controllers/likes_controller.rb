class LikesController < ApplicationController
  
  def like
    @post = Post.find(params[:id])
    @post.liked_by current_user

    respond_to do |format|
      format.js{}
    end
  end

  def unlike
    @post = Post.find(params[:id])
    @post.unliked_by current_user

    respond_to do |format|
      format.js{}
    end
  end
end
