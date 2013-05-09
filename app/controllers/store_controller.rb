class StoreController < ApplicationController
  protect_from_forgery
  layout "store"
  def index
    @products = Product.order("created_at DESC")
  end
end