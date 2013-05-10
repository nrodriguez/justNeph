require 'spec_helper'
include Extensions::MerchantExtensions::CafepressExtension

describe Extensions::MerchantExtensions::CafepressExtension do
  describe "adding and creating items" do
    context "#add_items" do
      before do
        FactoryGirl.create(:cafepress)
      end
      it "properly adds the products" do
        VCR.use_cassette 'merchant/cafepress' do
          add_cafepress_items.size.should > 0
       end
      end
    end
  end
end