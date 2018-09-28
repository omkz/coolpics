class HomeController < ApplicationController
  before_action :meme_new

  def index
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC").page(params[:page]).per(10)
    else
      @posts = Post.includes(:user).page(params[:page]).per(10)
    end
  end

  def meme_new
    @post = Post.new
  end

end
