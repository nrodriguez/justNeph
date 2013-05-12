module Extensions
  module ProductExtension    
    def add_included_extensions
      extensions = Pathname.glob("lib/extensions/merchant_extensions/*.rb")
        .map(&:basename)
        .collect{|x| 
          x.to_s.gsub(".rb", "")
          .titleize.gsub(" ","")
        }

      extensions.each do |merchant|
        self.class.send :include, "Extensions::MerchantExtensions::#{merchant}".constantize
      end
    end
    def add_items
      begin
        add_included_extensions
        Merchant.all.each do |merchant|
            send("add_#{merchant.name.downcase}_items")
        end
      rescue NoMethodError => e
        "Please address: #{e}"
      end
    end
  end
end