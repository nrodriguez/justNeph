require 'spec_helper'
include Extensions::MerchantExtensions::ZazzleExtension

describe Extensions::MerchantExtensions::ZazzleExtension do
  describe "adding and creating items" do
    context "#add_items" do
      before do
        FactoryGirl.create(:zazzle)
      end
      it "properly adds the products" do
        VCR.use_cassette 'merchant/zazzle', :record => :new_episodes do
          add_zazzle_items.size.should > 0
          Product.last.price.should_not == 0.0
       end
      end
    end
  end
end