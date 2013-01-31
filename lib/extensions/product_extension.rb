module Extensions
  module ProductExtension
    def create_product_hash(product_info)
      case product_info[:type]
      when "zazzle"
        return "zazzle"
      when "cafepress"
        return "cafepress"
      when "spreadshirt"
        return "spreadshirt"
      end
    end
  end
end