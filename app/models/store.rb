class Store < ActiveRecord::Base
  attr_accessible :name
  has_many :merchants
end
