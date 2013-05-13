module Extensions
  module MerchantExtensions
    module CafepressExtension
      def add_cafepress_items
        items = CafePressAPI.get_store_products('justnephmerch',Figaro.env.cafepress_key)
        items.each do |item|
          next if Product.exists?(:unique_id => item["id"])
          create_cafepress_item(item)
        end
      end
      #Creates a product from the cafepress hash
      #of an item
      def create_cafepress_item(item)
        attr = {
          name: item["name"],
          description: item["description"],
          category: item["categoryCaption"],
          price: item["sellPrice"],
          active: true,
          merchant_id: Merchant.find_by_name("CafePress").id,
          unique_id: item["id"],
          url: item['marketplaceUri'],
          image: item['productImage'].first['productUrl']
        }
        Product.create(attr)
      end
    end
  end
end