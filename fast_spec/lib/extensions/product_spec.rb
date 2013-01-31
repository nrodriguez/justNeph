require "no_rails_spec_support"
require "extensions/product_extension"
include Extensions::ProductExtension

describe Extensions::ProductExtension do
  it "should create a new product from a given product type" do
    product = {:type => "zazzle"}
    create_product_hash(product).should eq "zazzle"
  end
end