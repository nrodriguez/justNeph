class Merchant < ActiveRecord::Base
  attr_accessible :store_id, :name
  has_many :products
end
