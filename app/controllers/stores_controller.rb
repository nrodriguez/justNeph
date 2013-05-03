class StoresController < ApplicationController
  protect_from_forgery
  layout "stores"
  def index
    @products = Product.order("created_at DESC")
  end
end