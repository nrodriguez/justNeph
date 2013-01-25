class HomeController < ApplicationController
  protect_from_forgery
  layout "blog"
  include Extensions::TumblrExtension
  def index
    @posts = get_tumblr_posts
  end
end
