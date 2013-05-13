require "zazzle_rails"
module Extensions
  module MerchantExtensions
    module ZazzleExtension
      def add_zazzle_items
        products = ZazzleRails.get_products("justNeph")
        products[:items].each do |item|
          next if Product.exists?(:unique_id => item[:guid])
          create_zazzle_item(item)
        end
      end
      #Creates a product from the cafepress hash
      #of an item
      def create_zazzle_item(item)
        attr = {
          name: item[:title],
          description: item[:description],
          category: item[:keywords],
          price: item[:price],
          active: true,
          merchant_id: Merchant.find_by_name("Zazzle").id,
          unique_id: item[:guid],
          url: item[:link],
          image: item[:content]
        }
        Product.create(attr)
      end
    end
  end
end