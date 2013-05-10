module Extensions
  module ProductExtension
    include "Extensions::MerchantExtensions::CafepressExtension".constantize
    # def add_included_extensions
    #   extensions = Pathname.glob("lib/extensions/merchant/*.rb")
    #     .map(&:basename)
    #     .collect{|x| 
    #       x.to_s.gsub(".rb", "")
    #       .titleize.gsub(" ","")
    #     }

    #   extensions.each do |merchant|
    #     binding.pry
    #     include "Extensions::MerchantExtensions::#{merchant}".constantize
    #   end
    # end
    def add_items
      Merchant.all.each do |merchant|
        send("add_#{merchant.name.downcase}_items")
      end
    end
  end
end