require 'spec_helper'
include Extensions::MerchantExtensions::SpreadshirtAPI

describe Extensions::MerchantExtensions::SpreadshirtAPI do
  describe "When retrieving the products" do
    context "#get_products" do
      it "properly retrieves the product list" do
      end
    end
    context "#generate_product_url" do
      it "generates a working url" do
        name = "Test shirt"
        id = "12645838"
        generate_product_url(name, id).should == "http://justneph1.spreadshirt.com/test-shirt-A12645838"
      end
    end
  end
end