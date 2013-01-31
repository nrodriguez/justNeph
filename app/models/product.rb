class Product < ActiveRecord::Base
  belongs_to :store

  include Extensions::ProductExtension
end
