require 'spec_helper'

describe StoreController, type: :controller do
  context "GET /store" do
    it "gets the collection of products" do
      FactoryGirl.create_list(:product, 10)
      get :index
      response.status.should == 200
    end
  end
end