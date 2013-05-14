include Extensions::MerchantExtensions::SpreadshirtApi

module Extensions
  module MerchantExtensions
    module SpreadshirtExtension
      def add_spreadshirt_items
        products = SpreadshirtApi.get_products("460970")
        products.each do |item|
          next if Product.exists?(:unique_id => item[:id])
          create_spreadshirt_item(item)
        end
      end
      #Creates a product from the cafepress hash
      #of an item
      def create_spreadshirt_item(item)
        attr = {
          name: item[:name],
          description: item[:description],
          category: item[:category],
          price: item[:price],
          active: true,
          merchant_id: Merchant.find_by_name("Spreadshirt").id,
          unique_id: item[:id],
          url: item[:url],
          image: item[:image]
        }
        Product.create(attr)
      end
    end
  end
end