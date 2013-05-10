class AddMerchants < ActiveRecord::Migration
  def up
    ["Zazzle", "Spreadshirt", "Artscow"].each do |merch|
      Merchant.create(:name => merch, :store_id => 1 )
    end
  end

  def down
  end
end
