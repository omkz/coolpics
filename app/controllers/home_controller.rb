class HomeController < ApplicationController
  before_action :list

  def index
    @post = Post.new
  end

  def list
    @posts = Post.paginate(:page => params[:page], :per_page => 10)
  end
end
