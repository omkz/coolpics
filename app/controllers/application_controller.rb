class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :meme_new
  # protect_from_forgery with: :null_session
  #protect_from_forgery unless: -> { request.format.json? }

  def meme_new
    @meme = Post.new
  end

end
