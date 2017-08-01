module Api::V1
  class HomeController < ApiController

    def index
      @posts = Post.includes(:comments)
      render json: @posts
    end

  end
end