class HomeController < ApplicationController

  def index
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC").page(params[:page]).per(10)
    else
      @posts = Post.order("created_at DESC").includes(:user).page(params[:page]).per(10)
    end
  end

end
