module Extensions
  module MerchantExtensions
    module SpreadshirtApi
      def self.get_products(store_id)
        raw_products = get_articles_parsed(store_id)
        products = []
        raw_products.each do |raw_product|
          product = Hash.from_xml(Nokogiri::XML(open(raw_product["xlink:href"])).to_xml)["article"]
          product_attr = { 
            name: product["name"],
            price: product["price"]["vatExcluded"],
            id: product["id"],
            description: product["description"],
            category: "t-shirt",
            url: generate_product_url(product["name"], product["id"]),  
            image: "http://image.spreadshirt.com/image-server/v1/products/#{product["product"]["id"]}/views/1,width=500,height=500?mediaType=png"
          }
          products << product_attr
        end
        products
      end

      def generate_product_url(name, id)
        "http://justneph1.spreadshirt.com/#{name.downcase.gsub(" ", "-")}-A#{id}"
      end

      def get_articles_parsed(store_id)
        products = Hash.from_xml(Nokogiri::XML(open("http://api.spreadshirt.com/api/v1/shops/#{store_id}/articles")).to_xml)["articles"]["article"]
        if products.is_a? Array
          return products
        else
          [products]
        end
       end
    end
  end
end
