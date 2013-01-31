class StoreController < ApplicationController
  protect_from_forgery
  layout "store"
  def index
    #@products = Products.all.order_by(:created_at)
  end
end
