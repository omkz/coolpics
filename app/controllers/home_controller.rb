class HomeController < ApplicationController
  before_action :list

  def index
    @post = Post.new
  end

  def list
    @posts = Post.includes(:user).page(params[:page]).per(10)
  end
end
