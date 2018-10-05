class ApplicationController < ActionController::Base
  before_action :meme_new
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def meme_new
    @meme = Post.new
  end

end
