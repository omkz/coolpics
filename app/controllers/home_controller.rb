class HomeController < ApplicationController
  before_action :list

  def index
    @post = Post.new
  end

  def list
    @posts = Post.all
  end
end
