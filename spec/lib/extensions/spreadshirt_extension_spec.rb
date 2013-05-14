require 'spec_helper'
include Extensions::MerchantExtensions::SpreadshirtExtension

describe Extensions::MerchantExtensions::SpreadshirtExtension do
  describe "adding and creating items" do
    context "#add_items" do
      before do
        FactoryGirl.create(:spreadshirt)
      end
      it "properly adds the products" do
        VCR.use_cassette 'merchant/spreadshirt', :record => :new_episodes do
          add_spreadshirt_items.size.should > 0
          Product.last.price.should_not == 0.0
       end
      end
    end
  end
end