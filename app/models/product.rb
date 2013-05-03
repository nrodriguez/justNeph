class Product < ActiveRecord::Base
  attr_accessible :name, :description, :category,
    :price, :active, :unique_id, :merchant_id,
    :url, :image

  belongs_to :merchant

  validates_uniqueness_of :unique_id

  include Extensions::ProductExtension
end
